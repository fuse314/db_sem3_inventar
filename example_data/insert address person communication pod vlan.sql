INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (10,'Hintermwäldli','3 c'  ,'9015' ,'St. Gallen'      , 'CH-SG');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (11,'Hauptstrasse' ,'15 a' ,'9000' ,'St. Gallen'      , 'CH-SG');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (12,'Hauptstrasse' ,'15 b' ,'9000' ,'St. Gallen'      , 'CH-SG');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (13,'Rue des Alpes','2'    ,'1700' ,'Fribourg'        , 'CH-FR');
INSERT INTO Address (ID_Address,Street,StreetNumber,Plz,Location, IsoCountry) VALUES (14,'Brooklyn'     ,'23W4c','18278','New York City NY', 'US-NY');

INSERT INTO Person (ID_Person,FirstName,SurName,ID_Address) VALUES(10,'Gottfried','Mayer',10);

INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (1,'Direct Phone');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (2,'E-Mail');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (3,'Skype');
INSERT INTO CommunicationType (ID_CommunicationType, Description) VALUES (4,'Push Notification Key');

INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,1,'+41553283232');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,2,'jemand@microsoft.com');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,3,'echo123');
INSERT INTO Communication (ID_Person, ID_CommunicationType, CommunicationDetail) VALUES (10,4,'uESfxauij5tSx8KGu3mA3YB7cJsQqQ');

INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson,ID_InvoiceAddress) VALUES (1,1,10,8);
INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson,ID_InvoiceAddress) VALUES (2,3,1,6);
INSERT INTO POD (ID_Pod,ID_Customer,ID_ContactPerson,ID_InvoiceAddress) VALUES (3,3,10,8);

INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (1,1,11,NULL);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (2,1,12,1);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (3,2,11,NULL);
INSERT INTO Location (ID_Location,ID_Pod,ID_Address,ID_ParentLocation) VALUES (4,3,14,NULL);

INSERT INTO VLAN (ID_Vlan,ID_Location,Identifier,RangeStartIP4,RangeSubnetMask4,RangeDefaultGateway4,
  RangeStartIP6,RangeLength6,RangeDefaultGateway6) 
VALUES (1,1,15,INET_ATON('192.168.0.2'),INET_ATON('255.255.255.0'),INET_ATON('192.168.0.1'),
  HEX(INET6_ATON('3c3f::2')),1024,HEX(INET6_ATON('3c3f::1')) );