use usr_web98_5;

Drop View if exists v_usageperlocation;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER VIEW `usr_web98_5`.`v_usageperlocation` 
AS 
select 
  `l`.`ID_Location` AS `id_location`
  ,`dt`.`ID_DeviceType` as `ID_DeviceType`
  ,((ifnull(sum(ifnull((select count('x') 
     from (`usr_web98_5`.`networkinterface` `n` 
       join `usr_web98_5`.`relnetworkinterface` `rn` 
         on(((`n`.`ID_Networkinterface` = `rn`.`ID_NetworkinterfaceA`) 
         or (`n`.`ID_Networkinterface` = `rn`.`ID_NetworkinterfaceB`)))) 
     where 
	   (`n`.`ID_Device` = `d`.`ID_Device`)),0)),0) / sum(ifnull(`dt`.`NumInterfaces`,0))) * 100
    ) AS `Usage`
from 
  ((`usr_web98_5`.`location` `l` 
    join `usr_web98_5`.`device` `d` 
      on((`l`.`ID_Location` = `d`.`ID_Location`))) 
    join `usr_web98_5`.`devicetype` `dt` 
      on((`d`.`ID_DeviceType` = `dt`.`ID_DeviceType`))) 
group by 
  `dt`.`ID_DeviceType`, `l`.`ID_Location`;