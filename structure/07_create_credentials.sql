-- Tabelle Credentials wird erstellt.
CREATE TABLE Credentials (
  ID_Credentials int
, UserName varchar(42)
, Password varchar(42)
, SNMP_Community varchar(42)
, Plz int
, Location varchar(42)
, PRIMARY KEY (Id_Customer))