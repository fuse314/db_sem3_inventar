-- Tabelle Credential wird erstellt.
CREATE TABLE Credential (
  ID_Credential int not null auto_increment
, UserName varchar(42)
, Password varchar(42)
, SNMP_Community varchar(42)
, Plz int
, Location varchar(42)
, PRIMARY KEY (ID_Credential)
);