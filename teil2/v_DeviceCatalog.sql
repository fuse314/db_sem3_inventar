USE usr_web98_5;

DROP VIEW IF EXISTS v_DeviceCatalog;

CREATE VIEW v_DeviceCatalog AS

SELECT 
  dt.Manufacturer
, dc.Description AS TypeDescription
, dt.NumInterfaces
, mt.Speed
, mt.FullDuplex
, mt.Technology
, dt.Description
, r.Price
FROM devicetype AS dt
INNER JOIN devicecategory AS dc ON (dt.ID_DeviceCategory = dc.ID_DeviceCategory)
INNER JOIN mediumtype AS mt ON (dt.ID_MediumType = mt.ID_MediumType) AND (dc.Inactiv = 0)
INNER JOIN networkinterface AS i ON (mt.ID_MediumType = i.ID_MediumType)
INNER JOIN rate AS r ON (dt.ID_Rate = r.ID_Rate)
WHERE (dc.ValidFrom <= current_timestamp() OR dc.ValidFrom IS NULL)
      AND (dc.ValidTo >= current_timestamp()     OR dc.ValidTo IS NULL)
GROUP BY dt.Manufacturer, dc.Description