-- Tabelle Adresse wird erstellt
CREATE TABLE Address(
  Id_Address int auto_increment
, Street varchar(42)
, StreetNumber varchar(8)
, Plz varchar(42)
, Location varchar(42)
, IsoCountry varchar(8)
, PRIMARY KEY(Id_Address)
)