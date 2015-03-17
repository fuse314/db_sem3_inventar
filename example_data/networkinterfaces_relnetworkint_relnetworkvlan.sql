use inventar;

/* Main Switch Interfaces (only connected interfaces have a record in this table) */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (1,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (2,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (3,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (4,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (5,1,1000,1,NULL,NULL,1);
/* Router Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (6,1,1000,1,INET_ATON('192.168.16.1'),INET6_ATON('423c::1'),3);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (7,1,1000,1,INET_ATON('192.168.17.1'),INET6_ATON('423d::1'),3);
/* L3-Switch Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (8,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (9,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (10,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (11,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (12,1,1000,1,NULL,NULL,2);
/* Router 2 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (13,1,1000,1,INET_ATON('192.168.17.254'),INET6_ATON('423d::254'),4);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (14,1,1000,1,INET_ATON('192.168.24.254'),INET6_ATON('423f::254'),4);
/* WLAN 1 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (15,1,1000,1,NULL,NULL,5);
/* WLAN 2 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (16,1,1000,1,NULL,NULL,6);
/* Printer 1 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (17,1,100,1,INET_ATON('192.168.17.5'),NULL,7);
/* Printer 2 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (18,1,100,1,INET_ATON('192.168.16.7'),NULL,8);
/* WS1 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (19,1,1000,1,NULL,NULL,9);
/* WS2 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (20,1,1000,1,NULL,NULL,10);
/* AppServer Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (21,1,1000,1,INET_ATON('192.168.17.3'),NULL,11);
/* TestServer Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (22,1,1000,1,INET_ATON('192.168.17.4'),NULL,12);

/* Connections of Main Switch */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (1,1,8); /* to l3-switch */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (2,2,18); /* to printer 2 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (3,3,19); /* to WS1 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (4,4,20); /* to WS2 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (5,5,6); /* to Router */
/* Connections of WLAN 1 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (6,7,15); /* to Router */
/* Connections of L3-Switch */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (7,9,21); /* to AppServer */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (8,10,22); /* to TestServer */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (9,11,17); /* to Printer 1 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (10,12,13); /* to Router 2 */
/* Connections of WLAN 2 */
INSERT INTO RelNetworkinterface (ID_RelNetworkinterface,ID_NetworkinterfaceA,ID_NetworkinterfaceB) VALUES (11,14,16); /* to Router 2 */

/* VLAN from TestServer over Router 2 to WLAN 2 */
INSERT INTO RelNetworkinterfaceVLAN (ID_RelNetworkinterface,ID_VLAN) VALUES (8,1);
INSERT INTO RelNetworkinterfaceVLAN (ID_RelNetworkinterface,ID_VLAN) VALUES (10,1);
INSERT INTO RelNetworkinterfaceVLAN (ID_RelNetworkinterface,ID_VLAN) VALUES (11,1);








