drop view if exists v_logentries;

CREATE VIEW v_logentries AS
select
  l.ID_Log AS id
  ,concat((c.Name + ' / '),p.ID_Pod) AS pod
  ,concat(a.Street,' ',a.StreetNumber,', ',a.Plz,' ',a.Location) as location
  ,d.Hostname AS hostname
  ,l.Severity AS severity
  ,l.CreatedAt AS timestamp
  ,l.Message AS message
from log l
  join device d on d.ID_Device = l.ID_Device
  join location loc on d.ID_Location = loc.ID_Location
  left join address a on a.ID_Address = loc.ID_Address
  join pod p on loc.ID_Pod = p.ID_Pod
  join customer c on p.ID_Customer = c.ID_Customer
  where l.Acknowledged = 0;
