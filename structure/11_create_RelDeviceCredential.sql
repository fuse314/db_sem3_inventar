-- Verbindungstabelle RelDeviceCredential wird erstellt mit Verknpüfung zum Device und Credentials.
CREATE TABLE RelDeviceCredential (
  Id_RelDeviceCredential int auto_increment
, Id_Device int NOT NULL
, Id_Credentials int NOT NULL
, PRIMARY KEY (Id_RelDeviceCredential)
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, FOREIGN KEY (Id_Credentials) REFERENCES Credentials(Id_Credentials))