create table Rate (
  ID_Fare int auto_increment primary key,
  ID_ServiceType int,
  ID_Unit int,
  PricePerUnit decimal,
  ValidFrom date not null,
  ValidTo date,

  foreign key (ID_Unit) references Unit(ID_Unit),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
);
