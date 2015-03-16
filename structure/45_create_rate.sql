create table Rate (
  ID_Rate int auto_increment primary key,
  ID_ServiceType int not null,
  ID_Unit int not null,
  PricePerUnit decimal,
  ValidFrom date not null,
  ValidTo date,

  foreign key (ID_Unit) references Unit(ID_Unit),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
);
