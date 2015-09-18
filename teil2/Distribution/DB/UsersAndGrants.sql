use inventar;

create user 'gf'@'%' identified by 'GSgsEgHN5e'; /* Geschaeftsfuerer */
create user 'al'@'%' identified by 'fQf2EY7bb9'; /* Abteilungsleiter */
create user 'sb'@'%' identified by 'WnynxpgaNu'; /* Sachbearbeiter */
create user 'log'@'%' identified by 'NrjP6mmX4J'; /* Logger */
create user 'tool'@'%' identified by 'gv2EnGJjZc'; /* Tool */

grant select, insert, delete, update, execute on * to 'gf'@'%';
grant insert on pod to 'al'@'%';
grant insert on location to 'al'@'%';
grant select, insert on payment to 'gf'@'%';

/* select grants for sb (all tables except payment) */
/* SELECT CONCAT("GRANT select ON ", table_name, " TO 'sb'@'%';")
FROM information_schema.TABLES
WHERE table_schema = "inventar" AND table_name not in ("payment");  */
GRANT select ON address TO 'sb'@'%';
GRANT select ON communication TO 'sb'@'%';
GRANT select ON communicationtype TO 'sb'@'%';
GRANT select ON credential TO 'sb'@'%';
GRANT select ON customer TO 'sb'@'%';
GRANT select ON device TO 'sb'@'%';
GRANT select ON devicecategory TO 'sb'@'%';
GRANT select ON devicemachine TO 'sb'@'%';
GRANT select ON deviceprinter TO 'sb'@'%';
GRANT select ON devicerouter TO 'sb'@'%';
GRANT select ON deviceswitch TO 'sb'@'%';
GRANT select ON devicetype TO 'sb'@'%';
GRANT select ON devicewlanaccesspoint TO 'sb'@'%';
GRANT select ON invoice TO 'sb'@'%';
GRANT select ON invoiceposition TO 'sb'@'%';
GRANT select ON location TO 'sb'@'%';
GRANT select ON log TO 'sb'@'%';
GRANT select ON mediumtype TO 'sb'@'%';
GRANT select ON networkinterface TO 'sb'@'%';
GRANT select ON person TO 'sb'@'%';
GRANT select ON pod TO 'sb'@'%';
GRANT select ON rate TO 'sb'@'%';
GRANT select ON reldevicecredential TO 'sb'@'%';
GRANT select ON relnetworkinterface TO 'sb'@'%';
GRANT select ON relnetworkinterfacevlan TO 'sb'@'%';
GRANT select ON servicetype TO 'sb'@'%';
GRANT select ON unit TO 'sb'@'%';
GRANT select ON v_devicecatalog TO 'sb'@'%';
GRANT select ON v_freenetworkinterfaces TO 'sb'@'%';
GRANT select ON v_invoices TO 'sb'@'%';
GRANT select ON v_logentries TO 'sb'@'%';
GRANT select ON v_usageperlocation TO 'sb'@'%';
GRANT select ON v_usageperpod TO 'sb'@'%';
GRANT select ON vlan TO 'sb'@'%';
GRANT select ON wlanstandard TO 'sb'@'%';


/* insert grants for 'sb' (all tables except payment, pod, location) */
/* SELECT CONCAT("GRANT insert ON ", table_name, " TO 'sb'@'%';")
FROM information_schema.TABLES
WHERE table_schema = "inventar" AND table_name not in 
("pod","location","payment") AND table_name not like "v\_%";  */
GRANT insert ON address TO 'sb'@'%';
GRANT insert ON communication TO 'sb'@'%';
GRANT insert ON communicationtype TO 'sb'@'%';
GRANT insert ON credential TO 'sb'@'%';
GRANT insert ON customer TO 'sb'@'%';
GRANT insert ON device TO 'sb'@'%';
GRANT insert ON devicecategory TO 'sb'@'%';
GRANT insert ON devicemachine TO 'sb'@'%';
GRANT insert ON deviceprinter TO 'sb'@'%';
GRANT insert ON devicerouter TO 'sb'@'%';
GRANT insert ON deviceswitch TO 'sb'@'%';
GRANT insert ON devicetype TO 'sb'@'%';
GRANT insert ON devicewlanaccesspoint TO 'sb'@'%';
GRANT insert ON invoice TO 'sb'@'%';
GRANT insert ON invoiceposition TO 'sb'@'%';
GRANT insert ON log TO 'sb'@'%';
GRANT insert ON mediumtype TO 'sb'@'%';
GRANT insert ON networkinterface TO 'sb'@'%';
GRANT insert ON person TO 'sb'@'%';
GRANT insert ON rate TO 'sb'@'%';
GRANT insert ON reldevicecredential TO 'sb'@'%';
GRANT insert ON relnetworkinterface TO 'sb'@'%';
GRANT insert ON relnetworkinterfacevlan TO 'sb'@'%';
GRANT insert ON servicetype TO 'sb'@'%';
GRANT insert ON unit TO 'sb'@'%';
GRANT insert ON vlan TO 'sb'@'%';
GRANT insert ON wlanstandard TO 'sb'@'%';


grant execute on procedure P_LogMessageAdd to 'log'@'%';

grant select on V_LogEntries to 'tool'@'%';
grant execute on procedure P_LogClear to 'tool'@'%';

flush privileges;
