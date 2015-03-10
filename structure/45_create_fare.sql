create table Fare (
  ID_Fare int auto_increment primary key,
  ID_ServiceType int,
  ID_Unit int,
  ValidFrom date not null,

  foreign key (ID_Unit) references Unit(ID_Unit),
  foreign key (ID_ServiceType) references ServiceType(ID_ServiceType)
);
