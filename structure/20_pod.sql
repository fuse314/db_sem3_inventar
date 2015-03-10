
CREATE TABLE POD (
  ID_Pod INT NOT NULL AUTO_INCREMENT,
  ID_Customer INT NOT NULL,
  ID_ContactPerson INT NOT NULL,
  ID_InvoiceAddress INT NOT NULL,
  TimeZone VARCHAR(50) NULL DEFAULT 'Europe/Zurich',
  /* use php timezones:
     http://php.net/manual/de/timezones.php
  */
  PRIMARY KEY (ID_Pod),
  FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer),
  FOREIGN KEY (ID_ContactPerson) REFERENCES Person(ID_Person),
  FOREIGN KEY (ID_InvoiceAddress) REFERENCES Address(ID_Address)
);