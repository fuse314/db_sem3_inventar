insert into Unit(ID_Unit, name, abbreviation)
values(1, 'Stunde', 'h'),
(2, 'Stück', 'Stk.'),
(3, 'Kilometer', 'km');

insert into ServiceType(ID_ServiceType, name, ValidFrom)
values(1, 'Arbeitszeit', '01.01.2000'),
(2, 'Material', '01.01.2000'),
(3, 'Fahrtweg', '01.01.2000')

insert into Rate(ID_Rate, ID_ServiceType, ID_Unit, PricePerUnit, ValidFrom)
values(1, 1, 1, 180.0, '01.01.2000'),
(2, 1, 1, 200.0, '01.01.2010')
(3, 3, 3, 3.0, '01.01.2000'),

insert into Payment(ID_Payment, amount, paymentDate)
values(1, 100.0, '01.01.2014')

insert into Invoice(ID_Invoice, InvoiceDate, ID_Customer)
values(1, '16.03.2015', 1)

insert into InvoicePosition(ID_InvoicePosition, ID_Invoice, ID_ServiceType, amount, description)
values(1, 1, 3, 0.75, 'Fahrtweg zu Kunde'),
(2, 1, 1, 2.5, 'Installation Gerät XYZ')

insert into InvoicePosition(ID_InvoicePosition, ID_Invoice, ID_ServiceType, amount, description, price)
(3, 1, 2, 1, 'Installation Gerät XYZ', 599.95)
