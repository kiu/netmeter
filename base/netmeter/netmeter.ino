// https://github.com/kiu/netmeter

#include <WiFi.h>
#include <HTTPClient.h>
#include <ESP32Ping.h>
#include <tinyxml2.h>
using namespace tinyxml2;

// -- -- -- --

const unsigned rx_max = 50000000;
const unsigned tx_max =  5000000;
const unsigned ping_max = 100;

const unsigned interval = 1000 * 10;

const char* ssid = "myssid";
const char* password =  "secret";
const char* url = "http://fritz.box:49000/igdupnp/control/WANCommonIFC1";

const char* ping_host = "8.8.8.8";

// -- -- -- --

hw_timer_t * timer = NULL;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;

// -- -- -- --

const uint8_t rx_pin = 25;
const uint8_t rx_channel = 0;
unsigned long rx_value = 0;
uint8_t rx_pwm_dst = 0;
volatile uint8_t rx_pwm_cur = 0;

const uint8_t tx_pin = 33;
const uint8_t tx_channel = 1;
unsigned long tx_value = 0;
uint8_t tx_pwm_dst = 0;
volatile uint8_t tx_pwm_cur = 0;

const uint8_t ping_pin = 32;
const uint8_t ping_channel = 2;
unsigned long ping_value = 0;
uint8_t ping_pwm_dst = 0;
volatile uint8_t ping_pwm_cur = 0;

const uint8_t button_pin = 26;

// -- -- -- --

unsigned ntbr = 0;
unsigned ntbr_last = 0;

unsigned ntbs = 0;
unsigned ntbs_last = 0;

unsigned long req_millis_last = 0;

// -- -- -- --

volatile boolean testmode = false;
volatile unsigned long last_micros = micros();

// -- -- -- --

void wifi_connect() {
  if (WiFi.status() == WL_CONNECTED) {
    return;
  }

  while (WiFi.status() != WL_CONNECTED) {
    int numberOfNetworks = WiFi.scanNetworks();
    Serial.printf("WiFi scan: %d\n", numberOfNetworks);

    WiFi.begin(ssid, password);
    Serial.printf("WiFi connecting: %s\n", ssid);

    delay(5000);
  }

  Serial.print("WiFi connected: ");
  Serial.println(WiFi.localIP());
}

void run_query() {
  HTTPClient http;

  http.begin(url);
  http.addHeader("Content-Type", "text/xml");
  http.addHeader("User-Agent", "esp-idf/1.0 esp32");
  http.addHeader("Charset", "utf-8");
  http.addHeader("SoapAction", "urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1#GetAddonInfos");

  Serial.printf("HTTP: %s\n", url);
  int rc = http.POST("<?xml version=\"1.0\" encoding=\"utf-8\" ?><s:Envelope s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\"><s:Body><u:GetCommonLinkProperties xmlns:u=\"urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1\" /></s:Body></s:Envelope>");

  Serial.printf("HTTP: %d\n", rc);
  if (rc != 200) {
    http.end();
    return;
  }

  unsigned long tmp_millis = millis();

  String res = http.getString();  //Get the response to the request

  http.end();

  /*
    <?xml version="1.0" encoding="utf-8"?>
    <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <s:Body>
    <u:GetAddonInfosResponse xmlns:u="urn:schemas-upnp-org:service:WANCommonInterfaceConfig:1">
    <NewByteSendRate>1926</NewByteSendRate>
    <NewByteReceiveRate>3147</NewByteReceiveRate>
    <NewPacketSendRate>24</NewPacketSendRate>
    <NewPacketReceiveRate>13</NewPacketReceiveRate>
    <NewTotalBytesSent>4113851316</NewTotalBytesSent>
    <NewTotalBytesReceived>1149211977</NewTotalBytesReceived>
    <NewAutoDisconnectTime>0</NewAutoDisconnectTime>
    <NewIdleDisconnectTime>0</NewIdleDisconnectTime>
    <NewDNSServer1>212.18.3.5</NewDNSServer1>
    <NewDNSServer2>212.18.3.5</NewDNSServer2>
    <NewVoipDNSServer1>0.0.0.0</NewVoipDNSServer1>
    <NewVoipDNSServer2>0.0.0.0</NewVoipDNSServer2>
    <NewUpnpControlEnabled>0</NewUpnpControlEnabled>
    <NewRoutedBridgedModeBoth>0</NewRoutedBridgedModeBoth>
    </u:GetAddonInfosResponse>
    </s:Body>
    </s:Envelope>
  */

  XMLDocument xmlDocument;
  if (xmlDocument.Parse(res.c_str()) != XML_SUCCESS) {
    Serial.println("Could not parse XML");
    Serial.println(res);
    return;
  }

  XMLNode * root = xmlDocument.FirstChild();
  if (root == nullptr) {
    Serial.println("XML has no root");
    Serial.println(res);
    return;
  }

  XMLElement * e_envelop = root->NextSiblingElement(); // <s:Envelope>
  if (e_envelop == nullptr) {
    Serial.println("XML has no <s:Envelope>");
    Serial.println(res);
    return;
  }

  XMLElement * e_body = e_envelop->FirstChildElement(); // <s:Body>
  if (e_body == nullptr) {
    Serial.println("XML has no <s:Body>");
    Serial.println(res);
    return;
  }

  XMLElement * e_addon = e_body->FirstChildElement(); // <u:GetAddonInfosResponse>
  if (e_addon == nullptr) {
    Serial.println("XML has no <u:GetAddonInfosResponse>");
    Serial.println(res);
    return;
  }

  XMLElement * el_ntbr = e_addon->FirstChildElement("NewTotalBytesReceived");
  if (el_ntbr == nullptr) {
    Serial.println("XML has no <NewTotalBytesReceived>");
    Serial.println(res);
    return;
  }
  el_ntbr->QueryUnsignedText(&ntbr);

  XMLElement * el_ntbs = e_addon->FirstChildElement("NewTotalBytesSent");
  if (el_ntbs == nullptr) {
    Serial.println("XML has no <NewTotalBytesSent>");
    Serial.println(res);
    return;
  }
  el_ntbs->QueryUnsignedText(&ntbs);

  unsigned diff = (tmp_millis - req_millis_last) / 1000;

  if (ntbr_last != 0) {
    unsigned rx_tmp = (ntbr - ntbr_last) * 8 / diff;
    if (rx_tmp > rx_max) {
      rx_tmp = rx_max;
    }
    rx_value = rx_tmp;
  }

  if (ntbs_last != 0) {
    unsigned tx_tmp = (ntbs - ntbs_last) * 8 / diff;
    if (tx_tmp > tx_max) {
      tx_tmp = tx_max;
    }
    tx_value = tx_tmp;
  }

  ntbr_last = ntbr;
  ntbs_last = ntbs;
  req_millis_last = tmp_millis;

  Serial.printf("RX: %d bit/s\n", rx_value);
  Serial.printf("TX: %d bit/s\n", tx_value);
  rx_pwm_dst = (uint8_t)((float) rx_value / (float) rx_max * 255.0);
  tx_pwm_dst = (uint8_t)((float) tx_value / (float) tx_max * 255.0);
}

void run_ping() {
  bool ret = Ping.ping(ping_host, 1);
  if (!ret) {
    Serial.println("Ping failed");
    return;
  }

  unsigned ping_tmp = (unsigned)Ping.averageTime();
  if (ping_tmp > ping_max) {
    ping_tmp = ping_max;
  }
  ping_value = ping_tmp;

  Serial.printf("Ping: %d ms\n", ping_value);
  ping_pwm_dst = (uint8_t)((float) ping_value / (float) ping_max * 255.0);
}

void set_all(uint8_t value) {
  Serial.printf("Test: %d\n", value);
  rx_pwm_dst = value;
  tx_pwm_dst = value;
  ping_pwm_dst = value;
}

void run_test() {
  set_all(0xFF);
  delay(10000);
  set_all(0xCC);
  delay(10000);
  set_all(0x99);
  delay(10000);
  set_all(0x66);
  delay(10000);
  set_all(0x33);
  delay(10000);
  set_all(0x00);
  delay(10000);
}

uint8_t tick_step(uint8_t chan, uint8_t current, uint8_t target) {
  if (current == target) {
    return current;
  }
  if (current > target) {
    current--;
    ledcWrite(chan, current);
  }
  if (current < target) {
    current++;
    ledcWrite(chan, current);
  }
  return current;
}

void IRAM_ATTR tick() {
  portENTER_CRITICAL_ISR(&timerMux);
  rx_pwm_cur = tick_step(rx_channel, rx_pwm_cur, rx_pwm_dst);
  tx_pwm_cur = tick_step(tx_channel, tx_pwm_cur, tx_pwm_dst);
  ping_pwm_cur = tick_step(ping_channel, ping_pwm_cur, ping_pwm_dst);
  portEXIT_CRITICAL_ISR(&timerMux);
}

void IRAM_ATTR handleInterrupt() {
  if ((long)(micros() - last_micros) >= 500 * 1000) {
    testmode = !testmode;
    Serial.printf("Toggled testmode: %d\n", testmode);
    last_micros = micros();
  }
}

void setup() {
  Serial.begin(115200);
  Serial.println("Setup...");

  pinMode(rx_pin, OUTPUT);
  ledcSetup(rx_channel, 500, 8);
  ledcAttachPin(rx_pin, rx_channel);

  pinMode(tx_pin, OUTPUT);
  ledcSetup(tx_channel, 500, 8);
  ledcAttachPin(tx_pin, tx_channel);

  pinMode(ping_pin, OUTPUT);
  ledcSetup(ping_channel, 500, 8);
  ledcAttachPin(ping_pin, ping_channel);

  pinMode(button_pin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(button_pin), handleInterrupt, FALLING);

  timer = timerBegin(0, 80, true);
  timerAttachInterrupt(timer, &tick, true);
  timerAlarmWrite(timer, 10000, true);
  timerAlarmEnable(timer);

  set_all(0xFF);
  delay(3000);
  set_all(0x00);
  delay(3000);

  Serial.print("WiFi MAC: ");
  Serial.println(WiFi.macAddress());
}

void loop() {
  while (testmode) {
    run_test();
  }

  wifi_connect();

  Serial.println("-- -- --");

  run_query();
  run_ping();

  delay(interval);
}
