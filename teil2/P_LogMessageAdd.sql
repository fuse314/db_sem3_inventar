use usr_web98_5;

drop procedure if exists P_LogMessageAdd;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_LogMessageAdd`(in ID_Pod int, in Hostname varchar(100), in Severity int, in Message varchar(1000))
begin
  declare ID_Device int;
  Set ID_Device = null;
  Select d.ID_Device into ID_Device
	from Device d
    join Location l on l.ID_Location = d.ID_Location
    join POD p on p.ID_POD = l.ID_POD
    where d.Hostname = Hostname
    and p.ID_POD = ID_Pod;
  if ID_Device is not null then
	insert into Log(ID_Device,Severity,Message)
		values (ID_Device,Severity,Message);
  else
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Could not find Device with this Hostname and POD.';
  END if;
END$$
DELIMITER ;
