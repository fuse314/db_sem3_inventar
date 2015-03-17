-- datenbank inventar wird erstellt
create schema if not exists inventar;
use inventar;

-- table address
CREATE TABLE Address(
  Id_Address int auto_increment
, Street varchar(42)
, StreetNumber varchar(8)
, Plz varchar(42)
, Location varchar(42)
, IsoCountry varchar(8)
, PRIMARY KEY(Id_Address)
);

-- Tabelle Customer wird erstellt mit Verknpüfung zur Adresse. (Rechnungsadresse und normale Adresse)
CREATE TABLE Customer (
  ID_Customer int NOT NULL auto_increment
, Name varchar(42)
, ID_InvoiceAddress int
, ID_Address int NOT NULL
, PRIMARY KEY (ID_Customer)
, FOREIGN KEY (ID_InvoiceAddress) REFERENCES Address(ID_Address)
, FOREIGN KEY (ID_Address) REFERENCES Address(ID_Address));

-- Tabelle (Kontakt-)Person wird erstellt mit Verknpüfung zur Adresse.
CREATE TABLE Person (
  ID_Person int NOT NULL auto_increment
, FirstName varchar(42)
, SurName varchar(42)
, ID_Address int NOT NULL
, PRIMARY KEY (ID_Person)
, FOREIGN KEY (ID_Address) REFERENCES Address(ID_Address));

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
  RangeLength6 int UNSIGNED NULL,
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
  
CREATE TABLE DeviceType(
ID_DeviceType int auto_increment
,ID_DeviceCategory int not null
,Manufacturer varchar(100)
,ManufacturerNumber varchar(100)
,PRIMARY KEY(ID_DeviceType)
,Foreign Key (ID_DeviceCategory) references DeviceCategory (ID_DeviceCategory)
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
  ,IsPhysical boolean null
  ,Primary Key (ID_Device)
  ,Foreign Key (ID_Location) references Location (ID_Location)
  ,Foreign Key (ID_DeviceType) REFERENCES DeviceType(ID_DeviceType)
 );
 
CREATE TABLE DeviceSwitch(
  ID_Device int
  ,Ports int
  ,isPoESupported boolean
  ,PRIMARY Key (ID_Device)
  ,Foreign Key (ID_Device) references Device (ID_Device)
);

CREATE TABLE DeviceRouter(
  ID_Device int

 ,Description varchar(100)
 ,PRIMARY Key(ID_Device)
 ,Foreign Key (ID_Device) references Device (ID_Device)
);

CREATE TABLE WLANStandard(
  ID_WLANStandard int auto_increment
  ,Designation varchar(100)
  ,PRIMARY KEY (ID_WLANStandard)
);

CREATE TABLE DeviceWLANAccesspoint(
  ID_Device int
 ,ID_WLANStandard int
 ,AntennaType varchar(100)
 ,PRIMARY Key(ID_Device)
 ,Foreign Key (ID_Device) references Device (ID_Device)
 ,Foreign Key (ID_WLANStandard) references WLANStandard (ID_WLANStandard)
);

CREATE TABLE DevicePrinter(
  ID_Device int
  ,resolution varchar(100)
  ,pagesPerMinute decimal
  ,isColorPrinter boolean
  ,PRIMARY Key(ID_Device)
  ,Foreign Key (ID_Device) references Device (ID_Device)
);

CREATE TABLE DeviceWorkstation(
  ID_Device int
  ,
  ,PRIMARY Key(ID_Device)
  ,Foreign Key (ID_Device) references Device (ID_Device)
);

CREATE TABLE DeviceServer(
  ID_Device int
  
  ,PRIMARY Key(ID_Device)
  ,Foreign Key (ID_Device) references Device (ID_Device)
);

-- Tabelle Credential wird erstellt.
CREATE TABLE Credential (
  ID_Credential int not null auto_increment
, ID_Customer int not null
, UserName varchar(42)
, Password varchar(42)
, SNMP_Community varchar(42)
, Plz int
, Location varchar(42)
, PRIMARY KEY (ID_Credential)
, Foreign Key (ID_Customer) REFERENCES Customer(ID_Customer)
);

-- Verbindungstabelle RelDeviceCredential wird erstellt mit Verknpüfung zum Device und Credentials.
CREATE TABLE RelDeviceCredential (
  ID_Device int NOT NULL
, ID_Credential int NOT NULL
, PRIMARY KEY (ID_Device, ID_Credential)
, FOREIGN KEY (ID_Device) REFERENCES Device(ID_Device)
, FOREIGN KEY (ID_Credential) REFERENCES Credential(ID_Credential)
);

-- Tabelle Networkinterface wird erstellt
CREATE TABLE Networkinterface (
  ID_Networkinterface int not null auto_increment
, FullDuplex bool not null
, Speed int not null
, Physical bool not null
, ID_Device int not null
, FOREIGN KEY (ID_Device) REFERENCES Device(ID_Device)
, PRIMARY KEY (ID_Networkinterface)
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
, ID_Device int NOT NULL
, FOREIGN KEY (ID_Device) REFERENCES Device(ID_Device)
, PRIMARY KEY (ID_Log)
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

  foreign key (ID_Customer) references Customer(ID_Customer)
);

create table ServiceType (
  ID_ServiceType int auto_increment primary key,
  Description varchar(100) not null,
  ValidFrom date not null,
  ValidTo date null
);

create table InvoicePosition (
  ID_InvoicePosition int auto_increment primary key,
  ID_Invoice int not null,
  ID_ServiceType int,

  Amount decimal not null,
  Price decimal,
  Description varchar(100),

  ID_Networkinterface int,
  ID_Device int,
  ID_Location int,

  foreign key (ID_Invoice) references Invoice(ID_Invoice),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType),
  
  foreign key (ID_Networkinterface) references Networkinterface(ID_Networkinterface),
  foreign key (ID_Device) references Device(ID_Device),
  foreign key (ID_Location) references Location(ID_Location)
);

create table Unit (
  ID_Unit int auto_increment primary key,
  Description varchar(100) not null,
  Abbreviation varchar(5) not null
);

create table Rate (
  ID_Rate int auto_increment primary key,
  ID_ServiceType int,
  ID_Unit int,
  Price decimal not null,
  ValidFrom date not null,
  ValidTo date null,
  foreign key (ID_Unit) references Unit(ID_Unit),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
);

create table Payment (
  ID_Payment int auto_increment primary key,
  ID_Customer int not null,
  Amount decimal not null,
  PaymentDate date not null,
  foreign key (ID_Customer) references Customer(ID_Customer)
);
