-- Tabelle Adresse wird erstellt
CREATE TABLE Address(
  Id_Address int auto_increment
, Street varchar(42)
, StreetNumber varchar(8)
, Plz int
, Location varchar(42)
, PRIMARY KEY(Id_Address)
)