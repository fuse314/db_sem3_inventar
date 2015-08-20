use usr_web98_5;
Drop View if exists v_usageperpod;
VIEW `v_usageperpod` AS 
  Select 
    `p`.`ID_Pod` AS `id_pod`
	,(sum(`u`.`Usage`) / count(`u`.`Usage`)) AS `Usage` 
  From ((`v_usageperlocation` `u` 
    join `location` `l` 
	  on((`u`.`id_location` = `l`.`ID_Location`))) 
	join `pod` `p` 
	  on((`l`.`ID_Pod` = `p`.`ID_Pod`))) 
	join `usr_web98_5`.`device` `d` 
      on((`d`.`ID_Location` = `l`.`ID_Location`)))
	join `usr_web98_5`.`devicetype` `dt` 
      on((`d`.`ID_DeviceType` = `dt`.`ID_DeviceType`)))
  Group by 
    `dt`.`ID_DeviceType`, `p`.`ID_Pod` 