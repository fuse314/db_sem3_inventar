-- Verbindungstabelle RelDeviceCredential wird erstellt mit Verknpüfung zum Device und Credentials.
CREATE TABLE RelDeviceCredential (
  Id_Device int NOT NULL
, Id_Credential int NOT NULL
, PRIMARY KEY (Id_Device, Id_Credential)
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, FOREIGN KEY (Id_Credential) REFERENCES Credential(Id_Credential)
);