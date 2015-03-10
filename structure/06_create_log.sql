-- Tabelle Log wird erstellt
CREATE TABLE Log (
  ID_Log int auto_increment
, CreatedAt timestamp
, Level varchar(42)
, Message varchar(100)
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Log))