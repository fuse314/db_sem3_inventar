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