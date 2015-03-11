CREATE TABLE NetworkInterfaceConnectionVLAN (
  ID_NetworkInterfaceConnection INT NOT NULL,
  ID_VLAN INT NOT NULL,
  
  PRIMARY KEY (ID_NetworkInterface,ID_VLAN),
  FOREIGN KEY (ID_NetworkInterfaceConnection) REFERENCES NetworkInterfaceConnection(ID_NetworkInterfaceConnection),
  FOREIGN KEY (ID_VLAN) REFERENCES VLAN(ID_VLAN)
  );
