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