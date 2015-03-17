INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (1,'Switch');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (2,'Router');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (3,'WLAN Accesspoint');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (4,'Printer');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (5,'Workstation');
INSERT INTO DeviceCategory(ID_DeviceCategory,Description) VALUES (6,'Server');


INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (1, 2015-03-17, 2, 'Warning: Could not connect to the server', 1);
INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (2, 2015-03-17, 1, 'Information: Connected to Server'        , 2);
INSERT INTO Log (ID_Log, CreatedAt, Severity, Message, ID_Device) VALUES (3, 2015-03-17, 3, 'Error: Server unknown'                   , 3);

INSERT INTO Credential (ID_Credential, UserName, Password, SNMP_Community) VALUES (1, 'elias.schwarz'  , '734hgsue4', '234562dsaf');
INSERT INTO Credential (ID_Credential, UserName, Password, SNMP_Community) VALUES (2, 'melanie.mueller', 'asdf'     , 'dsafewr234');
INSERT INTO Credential (ID_Credential, UserName, Password, SNMP_Community) VALUES (3, 'hans.eberle'    , '1234'     , '234sa4dasf');
INSERT INTO Credential (ID_Credential, UserName, Password, SNMP_Community) VALUES (4, 'marcel.signer'  , ''         , '234sdfawer');

INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (1, 1);
INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (2, 1);
INSERT INTO RelDeviceCredential (ID_Device, ID_Credential) VALUES (3, 3);