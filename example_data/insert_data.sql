use inventar;

-- Inserts der Testadresse und Testpersonen
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (15,'Hintermwäldli','3 c'  ,'9015' ,'St. Gallen'      , 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (16,'Hauptstrasse' ,'15 a' ,'9000' ,'St. Gallen'      , 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (12,'Hauptstrasse' ,'15 b' ,'9000' ,'St. Gallen'      , 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (13,'Rue des Alpes','2'    ,'1700' ,'Fribourg'        , 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (14,'Brooklyn'     ,'23W4c','18278','New York City NY', 'US');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (1 , 'Musterstrasse'   , '1'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (2 , 'Musterstrasse'   , '2'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (3 , 'Musterstrasse'   , '3'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (4 , 'Musterstrasse'   , '4'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (5 , 'Rechnungsstrasse', '5'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (6 , 'Rechnungsstrasse', '6'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (7 , 'Rechnungsstrasse', '7'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (8 , 'Rechnungsstrasse', '8'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (9 , 'Bahnhofstrasse'  , '6'  ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (10, 'Rechnungsstrasse', '10' ,  '9000', 'St. Gallen', 'CH');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (11, 'Lafayette Street', '200', '10003', 'New York'  , 'US');

INSERT INTO Person VALUES(1, 'Elias'  , 'Schwarz'     , 1);
INSERT INTO Person VALUES(2, 'Nadine' , 'Müller'      , 2);
INSERT INTO Person VALUES(3, 'Peter'  , 'Mittelholzer', 3);
INSERT INTO Person VALUES(4, 'Melanie', 'Egger'       , 4);

insert INTO Customer VALUES(1, 'GemDat Informatik AG', 9, 10);
insert INTO Customer VALUES(2, 'Testfirma'           , 3, 9);
insert INTO Customer VALUES(3, 'Meisterfirma'        , 2, 10);

INSERT INTO Person (ID_Person,FirstName,SurName,ID_Address) VALUES(10,'Gottfried','Mayer',10);

INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (1,'Direct Phone');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (2,'E-Mail');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (3,'Skype');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (4,'Push Notification Key');

INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,1,'+41553283232');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,2,'jemand@microsoft.com');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,3,'echo123');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,4,'uESfxauij5tSx8KGu3mA3YB7cJsQqQ');

INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson) VALUES (1,1,10);
INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson) VALUES (2,3,1);
INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson) VALUES (3,3,10);

INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (1,1,11,NULL);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (2,1,12,1);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (3,2,11,NULL);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (4,3,14,NULL);

INSERT INTO VLAN (ID_Vlan,ID_Location,Identifier,RangeStartIP4,RangeSubnetMask4,RangeDefaultGateway4,
  RangeStartIP6,RangeLength6,RangeDefaultGateway6) 
VALUES (1,1,15,INET_ATON('192.168.0.2'),INET_ATON('255.255.255.0'),INET_ATON('192.168.0.1'),
  /*INET6_ATON('3c3f::2')*/ NULL,1024,/*INET6_ATON('3c3f::1')*/ NULL );


INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (1,'Switch');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (2,'Router');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (3,'WLAN Accesspoint');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (4,'Printer');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (5,'Workstation');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (6,'Server');


INSERT INTO Credential (ID_Credential, ID_Customer, UserName, Password, SNMP_Community) VALUES (1, 1, 'elias.schwarz'  , '734hgsue4', '234562dsaf');
INSERT INTO Credential (ID_Credential, ID_Customer, UserName, Password, SNMP_Community) VALUES (2, 1, 'melanie.mueller', 'asdf'     , 'dsafewr234');
INSERT INTO Credential (ID_Credential, ID_Customer, UserName, Password, SNMP_Community) VALUES (3, 1, 'hans.eberle'    , '1234'     , '234sa4dasf');
INSERT INTO Credential (ID_Credential, ID_Customer, UserName, Password, SNMP_Community) VALUES (4, 1, 'marcel.signer'  , ''         , '234sdfawer');

Insert into DeviceType(
  ID_DeviceType
  ,ID_DeviceCategory
  ,Manufacturer
  ,ManufacturerNumber
) Values 
(1, 1, 'Cisco', 'CS4582'),
(2, 2, 'DELL', 'D-388'),
(3, 3, 'HP', 'H-2600'),
(4, 4, 'Canon', 'CN1234'),
(5, 5, 'Dell', 'D-2050'),
(6, 6, 'Dell', 'D-4093');

Insert into Device(
  ID_Device
  ,ID_DeviceType
  ,ID_Location
  ,Hostname
  ,SerialNumber
  ,IsPhysical
) Values 
  (1, 1, 1, 'Main Switch','34054-4353-34534',true),
  (2, 1, 1, 'L3-Switch','34054-4353-4534',true),
  (3, 2, 2, 'My Router', '45345-53453-345-345', true),
  (4, 2, 2, 'Router 2', '564564-453-453', false),
  (5, 3, 3, 'WLAN 1', '453-3453-3453-45', true),
  (6, 3, 3, 'WLAN 2', '43545-3453-5433', true),
  (7, 4, 4, 'Printer 1', '4534-345345-3453', true),
  (8, 4, 4, 'Printer 2', '45345-45-453-44', true),
  (9, 5, 1, 'WS 1', '54353-34534-3453-345', true),
  (10, 5, 1, 'WS 2', '345345-3453-34534-345', true),
  (11, 6, 2, 'App-Server', '4567-767-67676', true),
  (12, 6, 2, 'Test Server', '45f56-767-767', false);
  
  
  
INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (1, '2015-03-17', 2, 'Warning: Could not connect to the server', 1);
INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (2, '2015-03-17', 1, 'Information: Connected to Server'        , 2);
INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (3, '2015-03-17', 3, 'Error: Server unknown'                   , 3);

INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (1, 1);
INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (2, 1);
INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (3, 3);

  
Insert into DeviceSwitch(
  ID_Device
  ,Ports
  ,isPoESupported
) Values
  (1, 24, false),
  (2, 32, false);
  
Insert into DeviceRouter(
  ID_Device
  ,Description
) Values
  (3, '1. Stock links'),
  (4, 'Serverraum');
  
Insert into WLANStandard(
  ID_WLANStandard
  ,Designation
) Values
  (1,'802.11'),
  (2, '802.11a'),
  (3, '802.11a'),
  (4, '802.11g'),
  (5, '802.11n'),
  (6, '802.11ac'),
  (7, '802.11ad');

Insert into DeviceWLANAccesspoint(
  ID_Device
  ,ID_WLANStandard
  ,AntennaType
) Values
  (5, 3, 'Omnidirectional'),
  (6, 7, 'Directional');
  
Insert into DevicePrinter(
  ID_Device
  ,resolution
  ,pagesPerMinute
  ,isColorPrinter
) Values
  (7, '4800x2400 dpi', 40.5, false),
  (8, '9600x2400 dpi', 25, true);
  
Insert into DeviceMachine(
  ID_Device
  ,Processors
  ,RAM
  ,StorageSize
  ,GPU
) Values
  (11, 'Intel Core i7-5960X', '12 GB', '4 TB', 'Asus Geforce GTX 960 STRIX'),
  (12, 'AMD FX-9590', '8 GB', '2 TB', 'Sapphire Radeon R9 285 Dual-X OC'); 
  

/* Main Switch Interfaces (only connected interfaces have a record in this table) */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (1,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (2,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (3,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (4,1,1000,1,NULL,NULL,1);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (5,1,1000,1,NULL,NULL,1);
/* Router Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (6,1,1000,1,INET_ATON('192.168.16.1'),/*INET6_ATON('423c::1')*/ NULL,3);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (7,1,1000,1,INET_ATON('192.168.17.1'),/*INET6_ATON('423d::1')*/ NULL,3);
/* L3-Switch Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (8,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (9,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (10,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (11,1,1000,1,NULL,NULL,2);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (12,1,1000,1,NULL,NULL,2);
/* Router 2 Interfaces */
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (13,1,1000,1,INET_ATON('192.168.17.254'),/*INET6_ATON('423d::254')*/ NULL,4);
INSERT INTO Networkinterface (ID_Networkinterface,FullDuplex,Speed,Physical,IPv4_Address,IPv6_Address,ID_Device) VALUES (14,1,1000,1,INET_ATON('192.168.24.254'),/*INET6_ATON('423f::254')*/ NULL,4);
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


insert into Unit(ID_Unit, description, abbreviation)
values(1, 'Stunde', 'h'),
(2, 'Stück', 'Stk.'),
(3, 'Kilometer', 'km');

insert into ServiceType(ID_ServiceType, description, ValidFrom)
values(1, 'Arbeitszeit', '01.01.2000'),
(2, 'Material', '01.01.2000'),
(3, 'Fahrtweg', '01.01.2000');

insert into Rate(ID_Rate, ID_ServiceType, ID_Unit, Price, ValidFrom, ValidTo)
values(1, 1, 1, 180.0, '01.01.2000', '31.12.2009'),
(2, 1, 1, 200.0, '01.01.2010', NULL),
(3, 3, 3, 3.0, '01.01.2000', NULL);

insert into Payment(ID_Payment, ID_Customer, amount, paymentDate)
values(1, 1,  100.0, '01.01.2014');

insert into Invoice(ID_Invoice, InvoiceDate, ID_Customer)
values(1, '16.03.2015', 1);

insert into InvoicePosition(ID_InvoicePosition, ID_Invoice, ID_ServiceType, amount, description)
values(1, 1, 3, 0.75, 'Fahrtweg zu Kunde'),
(2, 1, 1, 2.5, 'Installation Gerät XYZ');

insert into InvoicePosition(ID_InvoicePosition, ID_Invoice, ID_ServiceType, amount, description, price)
values(3, 1, 2, 1, 'Gerät XYZ', 599.95);



