create table Payment (
  ID_Payment int auto_increment primary key,
  ID_Customer int not null,
  amount decimal not null,
  paymentDate date not null,
  foreign key (ID_Customer) references Customer(ID_Customer)
);
