create table ServiceType (
  ID_ServiceType int auto_increment primary key,
  name varchar(100) not null,
  ValidFrom date not null,
  ValidTo date,
);
