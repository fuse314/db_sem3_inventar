use inventar;

INSERT INTO wlanstandard 
VALUES 
(1,'802.11'),
(2,'802.11a'),
(3,'802.11a'),
(4,'802.11g'),
(5,'802.11n'),
(6,'802.11ac'),
(7,'802.11ad');

INSERT INTO servicetype VALUES 
(1,'Arbeitszeit','2001-01-20',NULL),
(2,'Material','2001-01-20',NULL),
(3,'Fahrtweg','2001-01-20',NULL);

INSERT INTO unit VALUES 
(1,'Stunde','h'),
(2,'Stück','Stk.'),
(3,'Kilometer','km');


INSERT INTO address 
VALUES 
(15,'Hintermwäldli','3 c','9015','St. Gallen','CH'),
(16,'Hauptstrasse','15 a','9000','St. Gallen','CH'),
(12,'Hauptstrasse','15 b','9000','St. Gallen','CH'),
(13,'Rue des Alpes','2','1700','Fribourg','CH'),
(14,'Brooklyn','23W4c','18278','New York City NY','US'),
(1,'Musterstrasse','1','9000','St. Gallen','CH'),
(2,'Musterstrasse','2','9000','St. Gallen','CH'),
(3,'Musterstrasse','3','9000','St. Gallen','CH'),
(4,'Musterstrasse','4','9000','St. Gallen','CH'),
(5,'Rechnungsstrasse','5','9000','St. Gallen','CH'),
(6,'Rechnungsstrasse','6','9000','St. Gallen','CH'),
(7,'Rechnungsstrasse','7','9000','St. Gallen','CH'),
(8,'Rechnungsstrasse','8','9000','St. Gallen','CH'),
(9,'Bahnhofstrasse','6','9000','St. Gallen','CH'),
(10,'Rechnungsstrasse','10','9000','St. Gallen','CH'),
(11,'Lafayette Street','200','10003','New York','US');

INSERT INTO communicationtype 
VALUES 
(1,'Direct Phone'),
(2,'E-Mail'),
(3,'Skype'),
(4,'Push Notification Key');

INSERT INTO communication 
VALUES 
(10,1,'+41553283232'),
(10,2,'jemand@microsoft.com'),
(10,3,'echo123'),
(10,4,'uESfxauij5tSx8KGu3mA3YB7cJsQqQ');

INSERT INTO customer 
VALUES 
(1,'GemDat Informatik AG',9,10,NULL),
(2,'Testfirma',3,9,NULL),
(3,'Meisterfirma',2,10,NULL),
(11,'MauFirma',NULL,1,1000);

INSERT INTO credential VALUES 
(1,1,'elias.schwarz','734hgsue4','234562dsaf',NULL),
(2,1,'melanie.mueller','asdf','dsafewr234',NULL),
(3,1,'hans.eberle','1234','234sa4dasf',NULL),
(4,1,'marcel.signer','','234sdfawer',NULL);

INSERT INTO person 
VALUES 
(1,'Elias','Schwarz',1),
(2,'Nadine','Müller',2),
(3,'Peter','Mittelholzer',3),
(4,'Melanie','Egger',4),
(10,'Gottfried','Mayer',10);

INSERT INTO pod VALUES 
(1,1,10,'Europe/Zurich','PodEins',NULL,NULL,NULL),
(2,3,1,'Europe/Zurich','PodZwo',NULL,NULL,NULL),
(3,3,10,'Europe/Zurich','PodDreiii',NULL,NULL,NULL),
(4,11,1,'Schweiz','MauPod',NULL,NULL,NULL);

INSERT INTO location 
VALUES 
(1,1,11,NULL,'Uno'),
(2,1,12,1,'Duett'),
(3,2,11,NULL,'Tresses'),
(4,3,14,NULL,'Quattro'),
(5,4,11,NULL,'MauLocation'),
(6,3,14,NULL,'EscLocation');

INSERT INTO devicecategory 
VALUES 
(1,'Switch',0),
(2,'Router',0),
(3,'WLAN Accesspoint',0),
(4,'Printer',0),
(5,'Workstation',1),
(6,'Server',0);

INSERT INTO rate 
VALUES 
(1,1,1,180,'2001-01-20','2031-12-20'),
(2,1,1,200,'2001-01-20',NULL),
(3,3,3,3,'2001-01-20',NULL);

INSERT INTO mediumtype VALUES 
(1,'RJ-45 CAT5',1000,1,'1000BASE-T'),
(2,'RJ-45 CAT5e',1000,1,'1000BASE-T'),
(3,'RJ-45 CAT6',1000,1,'1000BASE-T'),
(4,'RJ-45 CAT7',1000,1,'1000BASE-T'),
(5,'RJ-45 CAT42',1000,1,'1000BASE-T');


INSERT INTO devicetype VALUES 
(1,1,'Cisco','CS4582',5,1,1,'Modell 1000'),
(2,2,'DELL','D-388',0,2,1,'Modell 3770'),
(3,3,'HP','H-2600',0,3,1,'Modell 4500'),
(4,4,'Canon','CN1234',0,2,1,'Modell 2000'),
(5,5,'Dell','D-2050',0,3,1,'Modell 3400'),
(6,6,'Dell','D-4093',0,1,1,'Modell 2200');

INSERT INTO device 
VALUES 
(1,1,1,'Main Switch','34054-4353-34534',1),
(2,1,1,'L3-Switch','34054-4353-4534',1),
(3,2,2,'My Router','45345-53453-345-345',1),
(4,2,2,'Router 2','564564-453-453',0),
(5,3,3,'WLAN 1','453-3453-3453-45',1),
(6,3,3,'WLAN 2','43545-3453-5433',1),
(7,4,4,'Printer 1','4534-345345-3453',1),
(8,4,4,'Printer 2','45345-45-453-44',1),
(9,5,1,'WS 1','54353-34534-3453-345',1),
(10,5,1,'WS 2','345345-3453-34534-345',1),
(11,6,2,'App-Server','4567-767-67676',1),
(12,6,2,'Test Server','45f56-767-767',0),
(24,1,5,'Windows Server','1234',1),
(25,1,5,'Linux Server','1234',1),
(26,1,5,'OS X Server','1234',1),
(27,1,5,'OS X Development Server','1234',1),
(28,1,5,'Build Server','1234',1),
(29,1,5,'localhost','1234',1);

INSERT INTO devicemachine 
VALUES 
(11,'Intel Core i7-5960X','12 GB','4 TB','Asus Geforce GTX 960 STRIX'),
(12,'AMD FX-9590','8 GB','2 TB','Sapphire Radeon R9 285 Dual-X OC');

INSERT INTO deviceprinter VALUES 
(7,'4800x2400 dpi',41,0),
(8,'9600x2400 dpi',25,1);

INSERT INTO devicerouter VALUES 
(3,'1. Stock links'),
(4,'Serverraum');

INSERT INTO deviceswitch VALUES 
(1,0),
(2,0);

INSERT INTO devicewlanaccesspoint VALUES 
(5,3,'Omnidirectional'),
(6,7,'Directional');


INSERT INTO networkinterface 
VALUES 
(1,1,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL),
(2,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(3,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(4,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(5,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL),
(6,1,3232239617,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),
(7,1,3232239873,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),
(8,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),
(9,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),
(10,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),
(11,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),
(12,1,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL),
(13,1,3232240126,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),
(14,1,3232241918,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL),
(15,1,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL),
(16,1,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL),
(17,1,3232239877,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL),
(18,1,3232239623,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL),
(19,1,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL),
(20,1,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL),
(21,1,3232239875,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL),
(22,1,3232239876,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL),
(23,1,NULL,NULL,12,23,1,NULL,NULL,NULL,NULL),
(24,NULL,NULL,NULL,24,5,NULL,NULL,NULL,NULL,NULL),
(25,NULL,NULL,NULL,24,4,NULL,NULL,NULL,NULL,NULL),
(26,NULL,NULL,NULL,24,3,NULL,NULL,NULL,NULL,NULL),
(27,NULL,NULL,NULL,24,2,NULL,NULL,NULL,NULL,NULL),
(28,NULL,NULL,NULL,24,1,NULL,NULL,NULL,NULL,NULL),
(29,NULL,NULL,NULL,25,5,NULL,NULL,NULL,NULL,NULL),
(30,NULL,NULL,NULL,25,4,NULL,NULL,NULL,NULL,NULL),
(31,NULL,NULL,NULL,25,3,NULL,NULL,NULL,NULL,NULL),
(32,NULL,NULL,NULL,25,2,NULL,NULL,NULL,NULL,NULL),
(33,NULL,NULL,NULL,25,1,NULL,NULL,NULL,NULL,NULL),
(34,NULL,NULL,NULL,26,5,NULL,NULL,NULL,NULL,NULL),
(35,NULL,NULL,NULL,26,4,NULL,NULL,NULL,NULL,NULL),
(36,NULL,NULL,NULL,26,3,NULL,NULL,NULL,NULL,NULL),
(37,NULL,NULL,NULL,26,2,NULL,NULL,NULL,NULL,NULL),
(38,NULL,NULL,NULL,26,1,NULL,NULL,NULL,NULL,NULL),
(39,NULL,NULL,NULL,27,5,NULL,NULL,NULL,NULL,NULL),
(40,NULL,NULL,NULL,27,4,NULL,NULL,NULL,NULL,NULL),
(41,NULL,NULL,NULL,27,3,NULL,NULL,NULL,NULL,NULL),
(42,NULL,NULL,NULL,27,2,NULL,NULL,NULL,NULL,NULL),
(43,NULL,NULL,NULL,27,1,NULL,NULL,NULL,NULL,NULL),
(44,NULL,NULL,NULL,28,5,NULL,NULL,NULL,NULL,NULL),
(45,NULL,NULL,NULL,28,4,NULL,NULL,NULL,NULL,NULL),
(46,NULL,NULL,NULL,28,3,NULL,NULL,NULL,NULL,NULL),
(47,NULL,NULL,NULL,28,2,NULL,NULL,NULL,NULL,NULL),
(48,NULL,NULL,NULL,28,1,NULL,NULL,NULL,NULL,NULL),
(49,1,167772216,NULL,29,1,1,NULL,NULL,NULL,NULL),
(50,1,168755204,NULL,29,2,1,NULL,NULL,NULL,NULL),
(51,1,3232235534,NULL,29,3,1,NULL,NULL,NULL,NULL),
(52,1,167783523,NULL,29,4,1,NULL,NULL,NULL,NULL),
(53,1,167783524,NULL,29,5,1,NULL,NULL,NULL,NULL);

INSERT INTO invoice VALUES 
(1,'2015-08-18',1,1),
(2,'2015-08-18',2,1),
(3,NULL,3,0),
(4,NULL,1,0),
(5,'2015-07-30',1,1),
(13,NULL,11,0),
(14,'2015-08-24',11,1);

INSERT INTO invoiceposition 
VALUES 
(1,1,1,100,NULL,'Fahrtweg zu Kunde',NULL,NULL,3),
(2,1,1,3,NULL,'Installation Gerät XYZ',NULL,3,3),
(3,1,2,1,600,'Gerät XYZ',NULL,2,NULL),
(4,2,NULL,1,6000,NULL,1,NULL,NULL),
(5,5,NULL,1,1100,NULL,2,NULL,NULL),
(8,14,NULL,1,600,'Geleistete Arbeit',NULL,NULL,5),
(7,14,NULL,1,500,'Fahrtweg',NULL,NULL,5),
(9,14,NULL,1,8000,'Material',NULL,NULL,5);

INSERT INTO log VALUES 
(6,'2015-08-12 16:56:28',3,'Is was passiert.',5,0),
(7,'2015-08-12 16:57:04',1,'Is was wichtiges passiert.',6,0),
(8,'2015-08-24 17:24:54',1,'billed pod',29,0),
(9,'2015-09-15 15:56:19',1,'es ist was passiert',11,0),
(10,'2015-09-15 15:56:49',1,'es ist was passiert',11,0);

INSERT INTO payment VALUES 
(1,1,100,'2001-01-20'),
(2,11,300,'2023-08-20'),
(3,11,300,'2015-08-23');

INSERT INTO vlan VALUES (1,1,15,3232235522,NULL,1024);

INSERT INTO reldevicecredential VALUES (1,1),(2,1),(3,3);

INSERT INTO relnetworkinterface 
VALUES 
(1,1,8),
(2,2,18),
(3,3,19),
(4,4,20),
(5,5,6),
(6,7,15),
(7,9,21),
(8,10,22),
(9,11,17),
(10,12,13),
(11,14,16),
(12,51,29),
(13,52,36);

INSERT INTO relnetworkinterfacevlan VALUES 
(8,1),
(10,1),
(11,1),
(12,1),
(13,1);