-- datenbank inventar wird erstellt
create schema if not exists inventar;
use inventar;

-- table address
CREATE TABLE Address(
  Id_Address int auto_increment
, Street varchar(42)
, StreetNumber varchar(8)
, Plz int
, Location varchar(42)
, PRIMARY KEY(Id_Address)
);

-- Tabelle Customer wird erstellt mit Verknpüfung zur Adresse. (Rechnungsadresse und normale Adresse)
CREATE TABLE Customer (
  Id_Customer int NOT NULL auto_increment
, Name varchar(42)
, Id_InvoiceAddress int
, Id_Address int NOT NULL
, PRIMARY KEY (Id_Customer)
, FOREIGN KEY (Id_InvoiceAddress) REFERENCES Address(Id_Address)
, FOREIGN KEY (Id_Address) REFERENCES Address(Id_Address));

-- Tabelle (Kontakt-)Person wird erstellt mit Verknpüfung zur Adresse.
CREATE TABLE Person (
  Id_Person int NOT NULL auto_increment
, FirstName varchar(42)
, SurName varchar(42)
, Id_Address int NOT NULL
, PRIMARY KEY (Id_Person)
, FOREIGN KEY (Id_Address) REFERENCES Address(Id_Address));

-- Tabelle PointOfDelivery (POD) erstellen mit Verknüpfungen zu Customer, Person, Address
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
  RangeSubnetMask6 VARBINARY(16) NULL,
  RangeDefaultGateway6 VARBINARY(16) NULL,

  PRIMARY KEY (ID_VLAN),
  FOREIGN KEY (ID_Location) REFERENCES Location(ID_Location)
  );

-- Tabelle DeviceCategory wird erstellt
CREATE TABLE DeviceCategory (
  ID_DeviceCategory INT NOT NULL AUTO_INCREMENT,
  Description VARCHAR(100),
  
  PRIMARY KEY (ID_DeviceCategory)
  );

-- Tabelle Device wird erstellt mit Verknüpfung zu Location,DeviceType
create table Device(
  ID_Device int auto_increment
  ,ID_DeviceType int Not Null
  ,ID_Location int Not Null
  ,Hostname varchar(500) null
  ,IPv4_Adresse varchar(500) null
  ,IPv6_Adresse varchar(500) null
  ,SerialNumber varchar(500) null
  ,isPhysical boolean null
  ,Primary Key (ID_Device)
  ,Foreign Key (ID_Location) references Location (ID_Location)
  /* ,Foreign Key (ID_DeviceType) REFERENCES DeviceType(ID_DeviceType) */
 );

-- Tabelle Credential wird erstellt.
CREATE TABLE Credential (
  ID_Credential int not null auto_increment
, UserName varchar(42)
, Password varchar(42)
, SNMP_Community varchar(42)
, Plz int
, Location varchar(42)
, PRIMARY KEY (ID_Credential)
);

-- Verbindungstabelle RelDeviceCredential wird erstellt mit Verknpüfung zum Device und Credentials.
CREATE TABLE RelDeviceCredential (
  Id_Device int NOT NULL
, Id_Credential int NOT NULL
, PRIMARY KEY (Id_Device, Id_Credential)
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, FOREIGN KEY (Id_Credential) REFERENCES Credential(Id_Credential)
);

-- Tabelle Networkinterface wird erstellt
CREATE TABLE Networkinterface (
  ID_Networkinterface int not null auto_increment
, FullDuplex bool not null
, Speed int not null
, Physical bool not null
, Id_Device int not null
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Networkinterface)
);

-- Tabelle RelNetworkinterface wird erstellt mit Verknüpfung zu Networkinterface,Networkinterface
CREATE TABLE RelNetworkinterface (
  ID_RelNetworkinterface INT NOT NULL AUTO_INCREMENT,
  ID_NetworkinterfaceA INT NOT NULL,
  ID_NetworkinterfaceB INT NOT NULL,
  
  PRIMARY KEY (ID_RelNetworkInterface),
  FOREIGN KEY (ID_NetworkinterfaceA) REFERENCES Networkinterface(ID_Networkinterface),
  FOREIGN KEY (ID_NetworkinterfaceB) REFERENCES Networkinterface(ID_Networkinterface)
  );

-- Tabelle RelNetworkinterfaceVLAN erstellen mit Verknüpfung zu RelNetworkinterface,VLAN
CREATE TABLE RelNetworkinterfaceVLAN (
  ID_RelNetworkinterface INT NOT NULL,
  ID_VLAN INT NOT NULL,
  
  PRIMARY KEY (ID_RelNetworkinterface,ID_VLAN),
  FOREIGN KEY (ID_RelNetworkinterface) REFERENCES RelNetworkinterface(ID_RelNetworkinterface),
  FOREIGN KEY (ID_VLAN) REFERENCES VLAN(ID_VLAN)
  );

-- Tabelle Log wird erstellt
CREATE TABLE Log (
  ID_Log int auto_increment
, CreatedAt timestamp
, Severity int
, Message varchar(1000)
, Id_Device int NOT NULL
, FOREIGN KEY (Id_Device) REFERENCES Device(Id_Device)
, PRIMARY KEY (Id_Log)
);

-- Tabelle CommunicationType wird angelegt
CREATE TABLE CommunicationType(
  ID_CommunicationType INT NOT NULL AUTO_INCREMENT,
  Description VARCHAR(50) NOT NULL,

  PRIMARY KEY (ID_CommunicationType)
  );

-- Tabelle Communication wird angelegt mit Verknüpfung auf Person,CommunicationType
CREATE TABLE Communication(
  ID_Person INT NOT NULL,
  ID_CommunicationType INT NOT NULL,
  CommunicationDetail VARCHAR(80) NOT NULL,

  PRIMARY KEY (ID_Person,ID_CommunicationType),
  FOREIGN KEY (ID_Person) REFERENCES Person(ID_Person),
  FOREIGN KEY (ID_CommunicationType) REFERENCES CommunicationType(ID_CommunicationType)
  );


create table Invoice (
  ID_Invoice int auto_increment primary key,
  InvoiceDate date not null,
  ID_Customer int not null,
  /*ID_Payment int null,*/

  foreign key (ID_Customer) references Customer(ID_Customer)
);

create table ServiceType (
  ID_ServiceType int auto_increment primary key,
  Name varchar(100) not null,
  ValidFrom date not null
);

create table InvoicePosition (
  ID_InvoicePosition int auto_increment primary key,
  ID_Invoice int not null,
  ID_ServiceType int,

  amount decimal not null,
  description varchar(100),

  ID_Networkinterface int,

  foreign key (ID_Invoice) references Invoice(ID_Invoice),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType),
  foreign key (ID_Networkinterface) references Networkinterface(ID_Networkinterface)
);

create table Unit (
  ID_Unit int auto_increment primary key,
  name varchar(100) not null,
  abbreviation varchar(5) not null
);

create table Fare (
  ID_Fare int auto_increment primary key,
  ID_ServiceType int,
  ID_Unit int,
  ValidFrom date not null,

  foreign key (ID_Unit) references Unit(ID_Unit),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
);

create table Payment (
  ID_Payment int auto_increment primary key,
  ID_Customer int not null,
  amount decimal not null,
  paymentDate date not null,
  foreign key (ID_Customer) references Customer(ID_Customer)
);