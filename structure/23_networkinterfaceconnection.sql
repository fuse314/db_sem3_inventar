CREATE TABLE NetworkInterfaceConnection (
  ID_NetworkInterfaceConnection INT NOT NULL AUTO_INCREMENT,
  ID_NetworkInterfaceA INT NOT NULL,
  ID_NetworkInterfaceB INT NOT NULL,
  
  PRIMARY KEY (ID_NetworkInterfaceConnection),
  FOREIGN KEY (ID_NetworkInterfaceA) REFERENCES NetworkInterface(ID_NetworkInterface),
  FOREIGN KEY (ID_NetworkInterfaceB) REFERENCES NetworkInterface(ID_NetworkInterface)
  );