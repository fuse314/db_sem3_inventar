create table InvoicePosition (
  ID_InvoicePosition int auto_increment primary key,
  ID_Invoice int not null,
  ID_ServiceType int,

  amount decimal not null,
  price decimal,
  description varchar(100),

  ID_NetworkInterfaceConnection int,

  foreign key (ID_Invoice) references Invoice(ID_Invoice),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
  foreign key (ID_NetworkInterface) references NetworkInterface(ID_NetworkInterface)
);
