use inventar;

Insert into Device(
  ID_Device
  ,ID_DeviceType
  ,ID_Location
  ,Hostname
  ,SerialNumber
  ,IsPhysical
) Values 
  (1, 1,'Main Swich','34054-4353-34534',true),
  (2, 1,'L3-Swich','34054-4353-4534',true),
  (3, 2, 'My Router', '45345-53453-345-345', true),
  (4, 2, 'My virtual Router' '564564-453-453', false),
  (5, 3, 'WLAN 1', '453-3453-3453-45', true),
  (6, 3, 'WLAN 2', '43545-3453-5433', true),
  (7, 4, 'Printer 1', '4534-345345-3453', true),
  (8, 4, 'Printer 2', '45345-45-453-44', true)