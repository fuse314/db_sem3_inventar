-- Tabelle Customer wird erstellt mit Verknpüfung zur Adresse. (Rechnungsadresse und normale Adresse)
CREATE TABLE Customer (
  Id_Customer int auto_increment
, Name varchar(42)
, Id_InvoiceAddress int
, Id_Address int NOT NULL
, PRIMARY KEY (Id_Customer)
, FOREIGN KEY (Id_InvoiceAddress) REFERENCES Address(Id_Address)
, FOREIGN KEY (Id_Address) REFERENCES Address(Id_Address))