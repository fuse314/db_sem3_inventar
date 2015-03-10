-- Tabelle Networkinterface wird erstellt
CREATE TABLE Networkinterface (
  ID_Networkinterface int auto_increment
, FullDuplex bool
, Speed int
, Physical bool
, Id_Device int
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Networkinterface))