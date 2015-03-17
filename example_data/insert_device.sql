use inventar;

Insert into DeviceType(
  ID_DeviceType
  ,ID_DeviceCategory
  ,Manufacturer
  ,ManufacturerNumber
) Values 
(1, 1, 'Cisco', 'CS4582'),
(3, 2, 'DELL', 'D-388'),
(4, 3, 'HP', 'H-2600'),
(5, 4, 'Canon', 'CN1234'),
(6, 5, 'Dell', 'D-2050'),
(7, 6, 'Dell', 'D-4093');

Insert into Device(
  ID_Device
  ,ID_DeviceType
  ,ID_Location
  ,Hostname
  ,SerialNumber
  ,IsPhysical
) Values 
  (1, 1, 1, 'Main Switch','34054-4353-34534',true),
  (2, 1, 1, 'L3-Switch','34054-4353-4534',true),
  (3, 2, 2, 'My Router', '45345-53453-345-345', true),
  (4, 2, 2, 'Router 2', '564564-453-453', false),
  (5, 3, 3, 'WLAN 1', '453-3453-3453-45', true),
  (6, 3, 3, 'WLAN 2', '43545-3453-5433', true),
  (7, 4, 4, 'Printer 1', '4534-345345-3453', true),
  (8, 4, 4, 'Printer 2', '45345-45-453-44', true),
  (9, 5, 1, 'WS 1', '54353-34534-3453-345', true),
  (10, 5, 1, 'WS 2', '345345-3453-34534-345', true),
  (11, 6, 2, 'App-Server', '4567-767-67676', true),
  (12, 6, 2, 'Test Server', '45f56-767-767', false);
  
Insert into DeviceSwitch(
  ID_Device
  ,Ports
  ,isPoESupported
) Values
  (1, 24, false),
  (2, 32, false);
  
Insert into DeviceRouter(
  ID_Device
  ,Description
) Values
  (3, '1. Stock links'),
  (4, 'Serverraum');
  
Insert into WLANStandard(
  ID_WLANStandard
  ,Designation
) Values
  (1,'802.11'),
  (2, '802.11a'),
  (3, '802.11a'),
  (4, '802.11g'),
  (5, '802.11n'),
  (6, '802.11ac'),
  (7, '802.11ad');

Insert into DeviceWLANAccesspoint(
  ID_Device
  ,ID_WLANStandard
  ,AntennaType
) Values
  (5, 3, 'Omnidirectional'),
  (6, 7, 'Directional');
  
Insert into DevicePrinter(
  ID_Device
  ,resolution
  ,pagePerMinute
  ,isColorPrinter
) Values
  (7, '4800x2400 dpi', 40.5, false),
  (8, '9600x2400 dpi', 25, true);
  
Insert into DeviceMachine(
  ID_Device
  ,Processors
  ,RAM
  ,StorageSize
  ,GPU
) Values
  (11, 'Intel Core i7-5960X', '12 GB', '4 TB', 'Asus Geforce GTX 960 STRIX'),
  (12, 'AMD FX-9590', '8 GB', '2 TB', 'Sapphire Radeon R9 285 Dual-X OC'); 
  