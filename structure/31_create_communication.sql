CREATE TABLE Communication(
  ID_Person INT NOT NULL,
  ID_CommunicationType INT NOT NULL,
  CommunicationDetail VARCHAR(80) NOT NULL,

  PRIMARY KEY (ID_Person,ID_CommunicationType),
  FOREIGN KEY (ID_Person) REFERENCES Person(ID_Person),
  FOREIGN KEY (ID_CommunicationType) REFERENCES CommunicationType(ID_CommunicationType)
  );
