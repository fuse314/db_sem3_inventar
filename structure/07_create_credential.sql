-- Tabelle Credential wird erstellt.
CREATE TABLE Credential (
  ID_Credential int not null auto_increment
, UserName varchar(100)
, Password varchar(100)
, SNMP_Community varchar(100)
, PRIMARY KEY (ID_Credential)
);