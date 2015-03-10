-- Tabelle Customer wird erstellt mit Verknpüfung zur Adresse. (Rechnungsadresse und normale Adresse)
CREATE TABLE Person (
  Id_Person int auto_increment
, FirstName varchar(42)
, SurName varchar(42)
, Id_InvoiceAddress int
, Id_Address int NOT NULL
, PRIMARY KEY (Id_Person)
, FOREIGN KEY (Id_Address) REFERENCES Address(Id_Address))