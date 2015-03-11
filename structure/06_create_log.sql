-- Tabelle Log wird erstellt
CREATE TABLE Log (
  ID_Log int auto_increment
, CreatedAt timestamp
, Severity int
, Message varchar(1000)
, Id_Device int NOT NULL
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Log))