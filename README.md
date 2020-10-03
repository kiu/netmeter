# netmeter
*netmeter* is a trio of analog panel meters showing the up-/download speed of my AVM FRITZ!Box 7360 and ping roundtrip times.

![netmeter](https://raw.githubusercontent.com/kiu/netmeter/master/pics/netmeter_banner.jpg)

Video: https://youtu.be/6VHqjQCAy3I

# Inspiration
*netmeter* is inspired by the 10 year old [megabitmeter](http://dk7sl.de/2010/11/11/megabitmeter/) and its - now defunct - commercial version [megabitmeter](http://megabitmeter.de).

# Tech Details
The [ESP32-DevKitC V4](https://www.espressif.com/en/products/devkits/esp32-devkitc) offers a powerful plug and play solution providing the core functionality of *netmeter*.
It connects to the network via wifi and polls the [UPnP](https://en.wikipedia.org/wiki/Universal_Plug_and_Play) interface of the FRITZ!Box obtaining the current transmitted and received bytes count of the WAN interface. In addition it runs a simple ping command to determine the roundtrip time. The results are transformed into PWM signals driving the meters.

The mechanical design features horizontal and vertical mounting of the panel meters. The included custom scales can be omitted to save costs. In that case a standard scale - e.g. 100A = 100 MBit/s - can be used.
