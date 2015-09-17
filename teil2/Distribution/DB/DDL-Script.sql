/* Datenbank  */
/*
drop database  if exists inventar;
Create database inventar;
Use inventar;
*/

drop database  if exists test_ruel;
Create database test_ruel;
Use test_ruel;

/* Tabellen */

Create Table if not exists address (
  Id_Address int(11) NOT NULL AUTO_INCREMENT,
  Street varchar(100) NULL,
  StreetNumber varchar(8) NULL,
  Plz varchar(100) NULL,
  Location varchar(100) NULL,
  IsoCountry varchar(8) NULL,
  PRIMARY KEY (Id_Address)
);
  
  CREATE TABLE if not exists person (
  ID_Person int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(100) NULL,
  SurName varchar(100) NULL,
  ID_Address int(11) NOT NULL,
  PRIMARY KEY (ID_Person),
  FOREIGN KEY (ID_Address) REFERENCES address(ID_Address)
 );

  CREATE TABLE if not exists communicationtype (
  ID_CommunicationType int(11) NOT NULL AUTO_INCREMENT,
  Description varchar(50) NOT NULL,
  PRIMARY KEY (ID_CommunicationType)
);
  
  CREATE TABLE if not exists communication (
  ID_Person int(11) NOT NULL,
  ID_CommunicationType int(11) NOT NULL,
  CommunicationDetail varchar(80) NOT NULL,
  PRIMARY KEY (ID_Person, ID_CommunicationType),
  FOREIGN KEY (ID_CommunicationType) REFERENCES communicationType(ID_CommunicationType)
);

CREATE TABLE if not exists customer (
  ID_Customer int(11) NOT NULL AUTO_INCREMENT,
  Name varchar(100) NULL,
  ID_InvoiceAddress int(11) NULL,
  ID_Address int(11) NOT NULL,
  InvoiceThreshold int(11) NULL,
  PRIMARY KEY (ID_Customer),
  FOREIGN KEY (ID_InvoiceAddress) REFERENCES address(ID_Address),
  FOREIGN KEY (ID_Address) REFERENCES address(ID_Address)
);

CREATE TABLE if not exists credential (
  ID_Credential int(11) NOT NULL AUTO_INCREMENT,
  ID_Customer int(11) NOT NULL,
  UserName varchar(100) NULL,
  Password varchar(100) NULL,
  SNMP_Community varchar(100) NULL,
  PrivilegeLevel int(11) NULL,
  PRIMARY KEY (ID_Credential),
  FOREIGN KEY (ID_Customer) REFERENCES customer(ID_Customer)
);

CREATE TABLE if not exists reldevicecredential (
  ID_Device int(11) NOT NULL,
  ID_Credential int(11) NOT NULL,
  PRIMARY KEY (ID_Device,ID_Credential),
  FOREIGN KEY (ID_Credential) REFERENCES credential(ID_Credential)
);

CREATE TABLE if not exists pod (
  ID_Pod int(11) NOT NULL AUTO_INCREMENT,
  ID_Customer int(11) NOT NULL,
  ID_ContactPerson int(11) NOT NULL,
  TimeZone varchar(50) DEFAULT 'Europe/Zurich',
  Description varchar(100) NOT NULL,
  DomainName varchar(100) NULL,
  NameServer bigint(20) NULL,
  SntpServer bigint(20) NULL,
  PRIMARY KEY (ID_Pod),
  FOREIGN KEY (ID_Customer) REFERENCES customer(ID_Customer),
  FOREIGN KEY (ID_ContactPerson) REFERENCES person(ID_Person)
);

CREATE TABLE if not exists location (
  ID_Location int(11) NOT NULL AUTO_INCREMENT,
  ID_Pod int(11) NOT NULL,
  ID_Address int(11) NOT NULL,
  ID_ParentLocation int(11) DEFAULT NULL,
  Description varchar(100) NOT NULL,
  PRIMARY KEY (ID_Location),
  FOREIGN KEY (ID_Pod) REFERENCES pod(ID_Pod),
  FOREIGN KEY (ID_Address) REFERENCES address(ID_Address),
  FOREIGN KEY (ID_ParentLocation) REFERENCES location(ID_Location)
); 

CREATE TABLE if not exists devicecategory (
  ID_DeviceCategory int(11) NOT NULL AUTO_INCREMENT,
  Description varchar(100) NULL,
  Inactiv tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID_DeviceCategory)
);

CREATE TABLE if not exists unit (
  ID_Unit int(11) NOT NULL AUTO_INCREMENT,
  Description varchar(100) NOT NULL,
  Abbreviation varchar(5) NOT NULL,
  PRIMARY KEY (ID_Unit)
);

CREATE TABLE if not exists servicetype (
  ID_ServiceType int(11) NOT NULL AUTO_INCREMENT,
  Description varchar(100) NOT NULL,
  ValidFrom date NOT NULL,
  ValidTo date DEFAULT NULL,
  PRIMARY KEY (ID_ServiceType)
);

CREATE TABLE if not exists wlanstandard (
  ID_WLANStandard int(11) NOT NULL AUTO_INCREMENT,
  Designation varchar(100) NULL,
  PRIMARY KEY (ID_WLANStandard)
);

CREATE TABLE if not exists rate (
  ID_Rate int(11) NOT NULL AUTO_INCREMENT,
  ID_ServiceType int(11) NULL,
  ID_Unit int(11) NULL,
  Price decimal(10,0) NOT NULL,
  ValidFrom date NOT NULL,
  ValidTo date NULL,
  PRIMARY KEY (ID_Rate),
  FOREIGN KEY (ID_Unit) REFERENCES unit(ID_Unit),
  FOREIGN KEY (ID_ServiceType) REFERENCES servicetype(ID_ServiceType)
);

CREATE TABLE if not exists mediumtype (
  ID_MediumType int(11) NOT NULL AUTO_INCREMENT,
  Description varchar(100) NOT NULL,
  Speed int(11) NULL,
  FullDuplex tinyint(4) NOT NULL DEFAULT '1',
  Technology varchar(100) NOT NULL DEFAULT '1000BASE-T',
  PRIMARY KEY (ID_MediumType)
);

CREATE TABLE if not exists devicetype (
  ID_DeviceType int(11) NOT NULL AUTO_INCREMENT,
  ID_DeviceCategory int(11) NOT NULL,
  Manufacturer varchar(100) NULL,
  ManufacturerNumber varchar(100) NULL,
  NumInterfaces int(11) NOT NULL,
  ID_Rate int(11) NULL,
  ID_MediumType int(11) NOT NULL DEFAULT '1',
  Description varchar(100) NULL,
  PRIMARY KEY (ID_DeviceType),
  FOREIGN KEY (ID_DeviceCategory) REFERENCES devicecategory(ID_DeviceCategory),
  FOREIGN KEY (ID_Rate) REFERENCES rate(ID_Rate),
  FOREIGN KEY (ID_MediumType) REFERENCES mediumtype(ID_MediumType)
);

CREATE TABLE if not exists device (
  ID_Device int(11) NOT NULL AUTO_INCREMENT,
  ID_DeviceType int(11) NOT NULL,
  ID_Location int(11) NOT NULL,
  Hostname varchar(100) NULL,
  SerialNumber varchar(100) NULL,
  IsPhysical tinyint(1)  NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Location) REFERENCES location(ID_Location),
  FOREIGN KEY (ID_DeviceType) REFERENCES deviceType(ID_DeviceType)
 );
 
 CREATE TABLE if not exists devicemachine (
  ID_Device int(11) NOT NULL DEFAULT '0',
  Processors varchar(100) NULL,
  RAM varchar(100) NULL,
  StorageSize varchar(100) NULL,
  GPU varchar(100) NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device)
);

CREATE TABLE if not exists deviceprinter (
  ID_Device int(11) NOT NULL DEFAULT '0',
  resolution varchar(100) NULL,
  pagesPerMinute decimal(10,0) NULL,
  isColorPrinter tinyint(1) NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device)
);

CREATE TABLE if not exists devicerouter (
  ID_Device int(11) NOT NULL DEFAULT '0',
  Description varchar(100) NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device)
);

CREATE TABLE if not exists deviceswitch (
  ID_Device int(11) NOT NULL DEFAULT '0',
  isPoESupported tinyint(1) DEFAULT NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device)
);

CREATE TABLE if not exists devicewlanaccesspoint (
  ID_Device int(11) NOT NULL DEFAULT '0',
  ID_WLANStandard int(11) NULL,
  AntennaType varchar(100) NULL,
  PRIMARY KEY (ID_Device),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device),
  FOREIGN KEY (ID_WLANStandard) REFERENCES wlanstandard(ID_WLANStandard)
);
 
 CREATE TABLE if not exists invoice (
  ID_Invoice int(11) NOT NULL AUTO_INCREMENT,
  InvoiceDate date NULL,
  ID_Customer int(11) NOT NULL,
  Closed tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID_Invoice),
  FOREIGN KEY (ID_Customer) REFERENCES customer(ID_Customer)
);

CREATE TABLE if not exists networkinterface (
  ID_Networkinterface int(11) NOT NULL AUTO_INCREMENT,
  Physical tinyint(1) NULL,
  IPv4_Address int(10) unsigned NULL,
  IPv6_Address varbinary(16) NULL,
  ID_Device int(11) NOT NULL,
  PortNr int(11) NULL,
  ID_MediumType int(11) NULL,
  Description varchar(100) NULL,
  IPv4_SubnetMask int(10) NULL,
  IPv4_DefaultGateway int(10) NULL,
  IPv6_DefaultGateway varchar(32) NULL,
  PRIMARY KEY (ID_Networkinterface),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device),
  FOREIGN KEY (ID_MediumType) REFERENCES mediumtype(ID_MediumType)
);

CREATE TABLE if not exists relnetworkinterface (
  ID_RelNetworkinterface int(11) NOT NULL AUTO_INCREMENT,
  ID_NetworkinterfaceA int(11) NOT NULL,
  ID_NetworkinterfaceB int(11) NOT NULL,
  PRIMARY KEY (ID_RelNetworkinterface),
  FOREIGN KEY (ID_NetworkinterfaceA) REFERENCES networkinterface(ID_Networkinterface),
  FOREIGN KEY (ID_NetworkinterfaceB) REFERENCES networkinterface(ID_Networkinterface)
);

CREATE TABLE if not exists invoiceposition (
  ID_InvoicePosition int(11) NOT NULL AUTO_INCREMENT,
  ID_Invoice int(11) NOT NULL,
  ID_ServiceType int(11) NULL,
  Amount decimal(10,0) NOT NULL,
  Price decimal(11,0) NULL,
  Description varchar(100) NULL,
  ID_Networkinterface int(11) NULL,
  ID_Device int(11) NULL,
  ID_Location int(11) NULL,
  PRIMARY KEY (ID_InvoicePosition),
  FOREIGN KEY (ID_Invoice) REFERENCES invoice(ID_Invoice),
  FOREIGN KEY (ID_ServiceType) REFERENCES servicetype(ID_ServiceType),
  FOREIGN KEY (ID_Networkinterface) REFERENCES networkinterface(ID_Networkinterface),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device),
  FOREIGN KEY (ID_Location) REFERENCES location(ID_Location)
);

CREATE TABLE if not exists log (
  ID_Log int(11) NOT NULL AUTO_INCREMENT,
  CreatedAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  Severity int(11) NULL,
  Message varchar(1000) NULL,
  ID_Device int(11) NOT NULL,
  Acknowledged int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID_Log),
  FOREIGN KEY (ID_Device) REFERENCES device(ID_Device)
);

CREATE TABLE if not exists payment (
  ID_Payment int(11) NOT NULL AUTO_INCREMENT,
  ID_Customer int(11) NOT NULL,
  Amount decimal(10,0) NOT NULL,
  PaymentDate date NOT NULL,
  PRIMARY KEY (ID_Payment),
  FOREIGN KEY (ID_Customer) REFERENCES customer(ID_Customer)
);

CREATE TABLE if not exists vlan (
  ID_Vlan int(11) NOT NULL AUTO_INCREMENT,
  ID_Location int(11) NOT NULL,
  Identifier int(11) NOT NULL,
  RangeStartIP4 int(10) unsigned NULL,
  RangeStartIP6 varbinary(16) NULL,
  RangeLength6 int(10) unsigned NULL,
  PRIMARY KEY (ID_Vlan),
  FOREIGN KEY (ID_Location) REFERENCES location(ID_Location)
);

CREATE TABLE if not exists relnetworkinterfacevlan (
  ID_RelNetworkinterface int(11) NOT NULL,
  ID_VLAN int(11) NOT NULL,
  PRIMARY KEY (ID_RelNetworkinterface, ID_VLAN),
  FOREIGN KEY (ID_VLAN) REFERENCES vlan(ID_VLAN)
);


/* Views */

CREATE OR REPLACE VIEW v_devicecatalog AS 
Select 
  dt.Manufacturer AS Manufacturer
  ,dc.Description AS TypeDescription
  ,dt.NumInterfaces AS NumInterfaces
  ,mt.Speed AS Speed,mt.FullDuplex AS FullDuplex
  ,mt.Description AS MediumTypeDescription
  ,dt.Description AS DeviceTypeDescription
  ,r.Price AS Price 
From 
  inventar.devicetype dt
    join inventar.devicecategory dc 
	  on dt.ID_DeviceCategory = dc.ID_DeviceCategory and dc.Inactiv = 0
	join inventar.mediumtype mt 
	 on dt.ID_MediumType = mt.ID_MediumType
	join inventar.networkinterface i 
	  on mt.ID_MediumType = i.ID_MediumType
	join inventar.rate r 
	  on dt.ID_Rate = r.ID_Rate
Group by 
  dt.Manufacturer,dc.Description;
  
CREATE OR REPLACE VIEW v_freenetworkinterfaces AS 
Select 
  l.Description AS LocationName
 ,d.Hostname AS Hostname
 ,ni.PortNr AS PortNumber
 ,mt.Description AS mediumtype
 ,mt.Speed AS MaxSpeed 
From 
  inventar.networkinterface ni 
    join inventar.device d 
      on d.ID_Device = ni.ID_Device 
    join inventar.location l 
      on l.ID_Location = d.ID_Location
    join inventar.devicetype dt 
      on dt.ID_DeviceType = d.ID_DeviceType 
    join inventar.mediumtype mt 
      on mt.ID_MediumType = dt.ID_MediumType 
Where 
  not exists(
    Select 'x' 
	From inventar.relnetworkinterface rn 
	Where 
	  rn.ID_NetworkinterfaceA = ni.ID_Networkinterface
	  OR rn.ID_NetworkinterfaceB = ni.ID_Networkinterface
	)
Order by 
  d.Hostname;
  
  
  DELIMITER $$
CREATE FUNCTION BetragRechnungMitGutschrift_F(ID_Invoice int) RETURNS decimal(10,0)
begin
declare sumRechnungen decimal;
declare sumPayments decimal;
declare AmountAktuelleRechnung decimal;
declare differenz decimal;
declare result decimal;

set AmountAktuelleRechnung = BetragRechnungOhneGutschrift_F(ID_Invoice);

 select  ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0) into sumRechnungen
		   from InvoicePosition ip
		   join invoice i on ip.id_invoice = i.id_invoice
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= InvoiceDate and ifnull(ValidTo, '01.01.2050') <= InvoiceDate
             
		   where i.id_customer = (select i2.id_customer from invoice i2 where i2.id_invoice = ID_Invoice);

select  
  ifnull(sum(amount), 0) into sumPayments
from 
  payment p
join customer c
  on p.id_customer = c.id_customer
join invoice i
  on i.id_customer = c.id_customer
  where i.id_invoice = ID_Invoice and p.PaymentDate <= i.InvoiceDate;

set differenz = sumRechnungen - sumPayments;

if differenz <= 0 then
  set result = 0;
elseif differenz < AmountAktuelleRechnung then
  set result = differenz;
else 
  set result = differenz;
end if;

return result;
end$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION BetragRechnungOhneGutschrift_F(ID_Invoice int) RETURNS decimal(10,0)
begin
declare sum decimal;
declare curdate datetime;
set curdate = curdate();
 select  ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0) into sum
		   from InvoicePosition ip
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= curdate and ifnull(ValidTo, curdate) <= curdate
             
		   where ip.ID_Invoice = ID_Invoice;
           
return sum;
end$$
DELIMITER ;


  
  /* v_invoice */
CREATE OR REPLACE VIEW v_invoices AS 
Select 
  i.ID_Invoice AS ID_Invoice
  ,i.InvoiceDate AS InvoiceDate
  ,i.ID_Customer AS ID_Customer
  ,i.Closed AS Closed
  ,BetragRechnungOhneGutschrift_F(i.ID_Invoice) AS BetragOhneGutschrift
  ,BetragRechnungMitGutschrift_F(i.ID_Invoice) AS BetragMitGutschrift 
 From 
   invoice i;

/* v_logentries */
CREATE OR REPLACE VIEW v_logentries AS 
Select 
  l.ID_Log AS id
  ,p.Description AS pod
  ,loc.Description AS location
  ,d.Hostname AS hostname
  ,l.Severity AS severity
  ,l.CreatedAt AS timestamp
  ,l.Message AS message 
From 
  log l 
    join device d 
	  on d.ID_Device = l.ID_Device 
	join location loc 
	  on d.ID_Location = loc.ID_Location
	left join address a 
	  on a.Id_Address = loc.ID_Address 
	join pod p 
	  on loc.ID_Pod = p.ID_Pod 
	join inventar.customer c 
	  on p.ID_Customer = c.ID_Customer 
Where 
  l.Acknowledged = 0;

/*v_usageperlocation */
CREATE or replace VIEW v_usageperlocation AS 
select l.ID_Location AS id_location
,dt.ID_DeviceType AS ID_DeviceType
,ifnull(sum(ifnull((
  select count('x') 
  from 
    inventar.networkinterface n 
    join relnetworkinterface rn on n.ID_Networkinterface = rn.ID_NetworkinterfaceA
    or n.ID_Networkinterface = rn.ID_NetworkinterfaceB 
  where 
    n.ID_Device = d.ID_Device
  ),0)),0) / sum(ifnull(dt.NumInterfaces,0) * 100) AS 'Usage' 

from 
location l 
  join device d 
    on l.ID_Location = d.ID_Location 
  join inventar.devicetype dt 
    on d.ID_DeviceType = dt.ID_DeviceType 
 group by 
   dt.ID_DeviceType,l.ID_Location;

/* v_usageperpod */
CREATE OR REPLACE VIEW v_usageperpod AS 
Select 
  p.ID_Pod AS id_pod
  ,(sum(u.Usage) / count(u.Usage)) AS 'Usage' 
 From 
   v_usageperlocation u 
     join inventar.location l 
	   on u.id_location = l.ID_Location
	 join inventar.pod p 
	   on l.ID_Pod = p.ID_Pod 
Group by 
  p.ID_Pod;
