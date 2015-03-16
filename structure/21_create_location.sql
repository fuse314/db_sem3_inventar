-- Tabelle Location wird erstellt mit Verknüpfung auf POD, Address, Location
CREATE TABLE Location (
  ID_Location INT NOT NULL AUTO_INCREMENT,
  ID_Pod INT NOT NULL,
  ID_Address INT NOT NULL,
  ID_ParentLocation INT NULL,
 
  PRIMARY KEY (ID_Location),
  FOREIGN KEY (ID_Pod) REFERENCES POD(ID_Pod),
  FOREIGN KEY (ID_Address) REFERENCES Address(ID_Address),
  FOREIGN KEY (ID_ParentLocation) REFERENCES Location(ID_Location)
);