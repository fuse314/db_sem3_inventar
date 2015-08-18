drop procedure if exists P_LogClear;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_LogClear`(in Id int)
begin
  if exists(select 'x' from Log where ID_Log = Id and Acknowledged = 0) then
    update Log set Acknowledged = 1 where ID_Log = Id;
  else
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Id not found or already acknowledged.';
  end if;
END$$
DELIMITER ;
