EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR01
U 1 1 5F52FE49
P 7650 2850
F 0 "#PWR01" H 7650 2600 50  0001 C CNN
F 1 "GND" H 7655 2677 50  0000 C CNN
F 2 "" H 7650 2850 50  0001 C CNN
F 3 "" H 7650 2850 50  0001 C CNN
	1    7650 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F53157D
P 7650 3450
F 0 "#PWR02" H 7650 3200 50  0001 C CNN
F 1 "GND" H 7655 3277 50  0000 C CNN
F 2 "" H 7650 3450 50  0001 C CNN
F 3 "" H 7650 3450 50  0001 C CNN
	1    7650 3450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F534250
P 6550 4150
F 0 "#PWR03" H 6550 3900 50  0001 C CNN
F 1 "GND" H 6555 3977 50  0000 C CNN
F 2 "" H 6550 4150 50  0001 C CNN
F 3 "" H 6550 4150 50  0001 C CNN
	1    6550 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 4150 6650 4150
Wire Wire Line
	7650 3450 7550 3450
Wire Wire Line
	7650 2850 7550 2850
$Comp
L power:GND #PWR06
U 1 1 5F536DF6
P 4800 3600
F 0 "#PWR06" H 4800 3350 50  0001 C CNN
F 1 "GND" H 4805 3427 50  0000 C CNN
F 2 "" H 4800 3600 50  0001 C CNN
F 3 "" H 4800 3600 50  0001 C CNN
	1    4800 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F5375E9
P 4800 4600
F 0 "#PWR07" H 4800 4350 50  0001 C CNN
F 1 "GND" V 4805 4472 50  0000 R CNN
F 2 "" H 4800 4600 50  0001 C CNN
F 3 "" H 4800 4600 50  0001 C CNN
	1    4800 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F53E4C3
P 5150 2400
F 0 "R1" V 4943 2400 50  0000 C CNN
F 1 "51R" V 5034 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5080 2400 50  0001 C CNN
F 3 "~" H 5150 2400 50  0001 C CNN
	1    5150 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F53F6F6
P 5150 3400
F 0 "R2" V 4943 3400 50  0000 C CNN
F 1 "51R" V 5034 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5080 3400 50  0001 C CNN
F 3 "~" H 5150 3400 50  0001 C CNN
	1    5150 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F53FADC
P 5150 4400
F 0 "R3" V 4943 4400 50  0000 C CNN
F 1 "51R" V 5034 4400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5080 4400 50  0001 C CNN
F 3 "~" H 5150 4400 50  0001 C CNN
	1    5150 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5F5402FE
P 5550 2400
F 0 "RV1" V 5343 2400 50  0000 C CNN
F 1 "250R" V 5434 2400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Piher_PT-10v10_Horizontal_Px10.0mm_Py5.0mm" H 5550 2400 50  0001 C CNN
F 3 "~" H 5550 2400 50  0001 C CNN
	1    5550 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_TRIM RV2
U 1 1 5F540F95
P 5550 3400
F 0 "RV2" V 5343 3400 50  0000 C CNN
F 1 "250R" V 5434 3400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Piher_PT-10v10_Horizontal_Px10.0mm_Py5.0mm" H 5550 3400 50  0001 C CNN
F 3 "~" H 5550 3400 50  0001 C CNN
	1    5550 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT_TRIM RV3
U 1 1 5F54154F
P 5550 4400
F 0 "RV3" V 5343 4400 50  0000 C CNN
F 1 "250R" V 5434 4400 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Piher_PT-10v10_Horizontal_Px10.0mm_Py5.0mm" H 5550 4400 50  0001 C CNN
F 3 "~" H 5550 4400 50  0001 C CNN
	1    5550 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 4400 4700 4400
Wire Wire Line
	5400 4400 5300 4400
Wire Wire Line
	5300 3400 5400 3400
Wire Wire Line
	5400 2400 5300 2400
Wire Wire Line
	5000 2400 4700 2400
Wire Wire Line
	5000 3400 4700 3400
$Comp
L Switch:SW_Push SW1
U 1 1 5F546118
P 5550 5500
F 0 "SW1" H 5550 5785 50  0000 C CNN
F 1 "SW_Push" H 5550 5694 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_B3S-1000" H 5550 5700 50  0001 C CNN
F 3 "~" H 5550 5700 50  0001 C CNN
	1    5550 5500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F547B26
P 5250 5500
F 0 "#PWR05" H 5250 5250 50  0001 C CNN
F 1 "GND" V 5255 5372 50  0000 R CNN
F 2 "" H 5250 5500 50  0001 C CNN
F 3 "" H 5250 5500 50  0001 C CNN
	1    5250 5500
	0    1    -1   0   
$EndComp
Wire Wire Line
	5250 5500 5350 5500
NoConn ~ 7550 2950
NoConn ~ 7550 3050
NoConn ~ 7550 3150
NoConn ~ 7550 3250
NoConn ~ 7550 3350
NoConn ~ 7550 3550
NoConn ~ 7550 3650
NoConn ~ 7550 3750
NoConn ~ 7550 3850
NoConn ~ 7550 3950
NoConn ~ 7550 4050
NoConn ~ 7550 4150
NoConn ~ 7550 4250
NoConn ~ 7550 4350
NoConn ~ 7550 4450
NoConn ~ 7550 4550
NoConn ~ 7550 4650
NoConn ~ 6650 2850
NoConn ~ 6650 2950
NoConn ~ 6650 3050
NoConn ~ 6650 3150
NoConn ~ 6650 3250
NoConn ~ 6650 3350
NoConn ~ 6650 3850
NoConn ~ 6650 3950
NoConn ~ 6650 4050
NoConn ~ 6650 4250
NoConn ~ 6650 4350
NoConn ~ 6650 4450
NoConn ~ 6650 4550
NoConn ~ 6650 4650
NoConn ~ 5700 2400
NoConn ~ 5700 3400
NoConn ~ 5700 4400
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F536003
P 4500 2600
F 0 "H2" V 4550 2800 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 3100 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 2600 50  0001 C CNN
F 3 "~" H 4500 2600 50  0001 C CNN
	1    4500 2600
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F5378DC
P 4500 2400
F 0 "H1" V 4550 2600 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 2900 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 2400 50  0001 C CNN
F 3 "~" H 4500 2400 50  0001 C CNN
	1    4500 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 2600 4600 2600
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5F545939
P 4500 3400
F 0 "H3" V 4550 3600 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 3900 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 3400 50  0001 C CNN
F 3 "~" H 4500 3400 50  0001 C CNN
	1    4500 3400
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 5F54608E
P 4500 4400
F 0 "H5" V 4550 4600 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 4900 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 4400 50  0001 C CNN
F 3 "~" H 4500 4400 50  0001 C CNN
	1    4500 4400
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F546758
P 4500 3600
F 0 "H4" V 4550 3800 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 4100 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 3600 50  0001 C CNN
F 3 "~" H 4500 3600 50  0001 C CNN
	1    4500 3600
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 5F54716B
P 4500 4600
F 0 "H6" V 4550 4800 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 5100 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 4600 50  0001 C CNN
F 3 "~" H 4500 4600 50  0001 C CNN
	1    4500 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 3600 4600 3600
Wire Wire Line
	4700 4600 4600 4600
$Comp
L Connector_Generic:Conn_01x20 J1
U 1 1 5F576A46
P 6850 3750
F 0 "J1" H 6800 4900 50  0000 L CNN
F 1 "Conn_01x20" H 6450 4800 50  0000 L CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x20_Pitch2.54mm" H 6850 3750 50  0001 C CNN
F 3 "~" H 6850 3750 50  0001 C CNN
	1    6850 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J2
U 1 1 5F5782D0
P 7350 3750
F 0 "J2" H 7350 4900 50  0000 C CNN
F 1 "Conn_01x20" H 7200 4800 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x20_Pitch2.54mm" H 7350 3750 50  0001 C CNN
F 3 "~" H 7350 3750 50  0001 C CNN
	1    7350 3750
	-1   0    0    -1  
$EndComp
NoConn ~ 6650 4750
NoConn ~ 7550 4750
Wire Wire Line
	5550 2550 6000 2550
Wire Wire Line
	5550 3550 6650 3550
Wire Wire Line
	6000 3650 6650 3650
Wire Wire Line
	5550 4550 6000 4550
Wire Wire Line
	6000 3450 6650 3450
Wire Wire Line
	6100 3750 6650 3750
Wire Wire Line
	5750 5500 6100 5500
$Comp
L power:GND #PWR04
U 1 1 5F535EB6
P 4800 2600
F 0 "#PWR04" H 4800 2350 50  0001 C CNN
F 1 "GND" H 4805 2427 50  0000 C CNN
F 2 "" H 4800 2600 50  0001 C CNN
F 3 "" H 4800 2600 50  0001 C CNN
	1    4800 2600
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 5F53C61C
P 4500 2200
F 0 "H7" V 4550 2400 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 2700 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 2200 50  0001 C CNN
F 3 "~" H 4500 2200 50  0001 C CNN
	1    4500 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 2200 4700 2200
Wire Wire Line
	4700 2200 4700 2400
Connection ~ 4700 2400
Wire Wire Line
	4700 2400 4600 2400
$Comp
L Mechanical:MountingHole_Pad H8
U 1 1 5F53D023
P 4500 2800
F 0 "H8" V 4550 3000 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 3300 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 2800 50  0001 C CNN
F 3 "~" H 4500 2800 50  0001 C CNN
	1    4500 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 2800 4700 2800
Wire Wire Line
	4700 2800 4700 2600
Wire Wire Line
	4800 2600 4700 2600
Connection ~ 4700 2600
$Comp
L Mechanical:MountingHole_Pad H9
U 1 1 5F53E5E1
P 4500 3200
F 0 "H9" V 4550 3400 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 3700 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 3200 50  0001 C CNN
F 3 "~" H 4500 3200 50  0001 C CNN
	1    4500 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 3200 4700 3200
Wire Wire Line
	4700 3200 4700 3400
Connection ~ 4700 3400
Wire Wire Line
	4700 3400 4600 3400
$Comp
L Mechanical:MountingHole_Pad H10
U 1 1 5F54174A
P 4500 3800
F 0 "H10" V 4550 4000 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 4300 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 3800 50  0001 C CNN
F 3 "~" H 4500 3800 50  0001 C CNN
	1    4500 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 3800 4700 3800
Wire Wire Line
	4700 3800 4700 3600
Wire Wire Line
	4800 3600 4700 3600
Connection ~ 4700 3600
$Comp
L Mechanical:MountingHole_Pad H11
U 1 1 5F544D8B
P 4500 4200
F 0 "H11" V 4550 4400 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 4700 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 4200 50  0001 C CNN
F 3 "~" H 4500 4200 50  0001 C CNN
	1    4500 4200
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H12
U 1 1 5F546A08
P 4500 4800
F 0 "H12" V 4550 5000 50  0000 C CNN
F 1 "MountingHole_Pad" V 4450 5300 50  0000 C CNN
F 2 "Mounting_Holes:MountingHole_4.3mm_M4_Pad_Via" H 4500 4800 50  0001 C CNN
F 3 "~" H 4500 4800 50  0001 C CNN
	1    4500 4800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 4800 4700 4800
Wire Wire Line
	4700 4800 4700 4600
Wire Wire Line
	4700 4600 4800 4600
Connection ~ 4700 4600
Wire Wire Line
	4600 4200 4700 4200
Wire Wire Line
	4700 4200 4700 4400
Connection ~ 4700 4400
Wire Wire Line
	4700 4400 4600 4400
Wire Wire Line
	6000 2550 6000 3450
Wire Wire Line
	6000 3650 6000 4550
Wire Wire Line
	6100 3750 6100 5500
$EndSCHEMATC
