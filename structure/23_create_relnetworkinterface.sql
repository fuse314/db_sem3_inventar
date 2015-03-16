-- Tabelle RelNetworkinterface wird erstellt mit Verknüpfung zu Networkinterface,Networkinterface
CREATE TABLE RelNetworkinterface (
  ID_RelNetworkinterface INT NOT NULL AUTO_INCREMENT,
  ID_NetworkinterfaceA INT NOT NULL,
  ID_NetworkinterfaceB INT NOT NULL,
  
  PRIMARY KEY (ID_RelNetworkInterface),
  FOREIGN KEY (ID_NetworkinterfaceA) REFERENCES Networkinterface(ID_Networkinterface),
  FOREIGN KEY (ID_NetworkinterfaceB) REFERENCES Networkinterface(ID_Networkinterface)
  );
