-- Tabelle RelNetworkinterfaceVLAN erstellen mit Verknüpfung zu RelNetworkinterface,VLAN
CREATE TABLE RelNetworkinterfaceVLAN (
  ID_RelNetworkinterface INT NOT NULL,
  ID_VLAN INT NOT NULL,
  
  PRIMARY KEY (ID_RelNetworkinterface,ID_VLAN),
  FOREIGN KEY (ID_RelNetworkinterface) REFERENCES RelNetworkinterface(ID_RelNetworkinterface),
  FOREIGN KEY (ID_VLAN) REFERENCES VLAN(ID_VLAN)
  );