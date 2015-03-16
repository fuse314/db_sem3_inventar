-- Tabelle VLAN wird erstellt mit Verknüpfung zu Location
CREATE TABLE VLAN (
  ID_Vlan INT NOT NULL AUTO_INCREMENT,
  ID_Location INT NOT NULL,
  /* VLAN ID */
  Identifier INT NOT NULL,
  
  /* IPV4:
    Select: INET_NTOA(RangeStartIP4)
	Insert: INET_ATON('10.0.0.0') */
  RangeStartIP4 INT UNSIGNED NULL,
  RangeSubnetMask4 INT UNSIGNED NULL,
  RangeDefaultGateway4 INT UNSIGNED NULL,
  
  /*IPV6:
	Select: HEX(INET6_NTOA(RangeStartIP6))
    Insert: HEX(INET6_ATON('ffff::ff')) */
  RangeStartIP6 VARBINARY(16) NULL ,
  RangeLength6 unsigned int NULL,
  RangeDefaultGateway6 VARBINARY(16) NULL,

  PRIMARY KEY (ID_VLAN),
  FOREIGN KEY (ID_Location) REFERENCES Location(ID_Location)
  );
