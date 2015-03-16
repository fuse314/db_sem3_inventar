-- Tabelle Networkinterface wird erstellt
CREATE TABLE Networkinterface (
  ID_Networkinterface int not null auto_increment
, FullDuplex bool not null
, Speed int not null
, Physical bool not null
, Id_Device int not null
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Networkinterface)
);