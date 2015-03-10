
create table Invoice (
  ID_Invoice int auto_increment primary key,
  InvoiceDate date not null,
  ID_Customer int not null,
  /*ID_Payment int null,*/

  foreign key (ID_Customer) references Customer(ID_Customer)
);
