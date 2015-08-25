
create user 'gf'@'%' identified by 'GSgsEgHN5e'; /* Geschaeftsfuerer */
create user 'al'@'%' identified by 'fQf2EY7bb9'; /* Abteilungsleiter */
create user 'sb'@'%' identified by 'WnynxpgaNu'; /* Sachbearbeiter */
create user 'log'@'%' identified by 'NrjP6mmX4J'; /* Logger */
create user 'tool'@'%' identified by 'gv2EnGJjZc'; /* Tool */

grant select, insert, delete, update, execute on inventar.* to 'gf'@'%';
grant insert on inventar.pod to 'al'@'%';
grant insert on inventar.location to 'al'@'%';
grant select, insert on inventar.payment to 'gf'@'%';

/* select grants for sb (all tables except payment) */
/* SELECT CONCAT("GRANT select ON inventar.", table_name, " TO 'sb'@'%';")
FROM information_schema.TABLES
WHERE table_schema = "inventar" AND table_name not in ("payment");  */
GRANT select ON inventar.address TO 'sb'@'%';
GRANT select ON inventar.communication TO 'sb'@'%';
GRANT select ON inventar.communicationtype TO 'sb'@'%';
GRANT select ON inventar.credential TO 'sb'@'%';
GRANT select ON inventar.customer TO 'sb'@'%';
GRANT select ON inventar.device TO 'sb'@'%';
GRANT select ON inventar.devicecategory TO 'sb'@'%';
GRANT select ON inventar.devicemachine TO 'sb'@'%';
GRANT select ON inventar.deviceprinter TO 'sb'@'%';
GRANT select ON inventar.devicerouter TO 'sb'@'%';
GRANT select ON inventar.deviceswitch TO 'sb'@'%';
GRANT select ON inventar.devicetype TO 'sb'@'%';
GRANT select ON inventar.devicewlanaccesspoint TO 'sb'@'%';
GRANT select ON inventar.invoice TO 'sb'@'%';
GRANT select ON inventar.invoiceposition TO 'sb'@'%';
GRANT select ON inventar.location TO 'sb'@'%';
GRANT select ON inventar.log TO 'sb'@'%';
GRANT select ON inventar.mediumtype TO 'sb'@'%';
GRANT select ON inventar.networkinterface TO 'sb'@'%';
GRANT select ON inventar.person TO 'sb'@'%';
GRANT select ON inventar.pod TO 'sb'@'%';
GRANT select ON inventar.rate TO 'sb'@'%';
GRANT select ON inventar.reldevicecredential TO 'sb'@'%';
GRANT select ON inventar.relnetworkinterface TO 'sb'@'%';
GRANT select ON inventar.relnetworkinterfacevlan TO 'sb'@'%';
GRANT select ON inventar.servicetype TO 'sb'@'%';
GRANT select ON inventar.unit TO 'sb'@'%';
GRANT select ON inventar.v_devicecatalog TO 'sb'@'%';
GRANT select ON inventar.v_freenetworkinterfaces TO 'sb'@'%';
GRANT select ON inventar.v_invoices TO 'sb'@'%';
GRANT select ON inventar.v_logentries TO 'sb'@'%';
GRANT select ON inventar.v_usageperlocation TO 'sb'@'%';
GRANT select ON inventar.v_usageperpod TO 'sb'@'%';
GRANT select ON inventar.vlan TO 'sb'@'%';
GRANT select ON inventar.wlanstandard TO 'sb'@'%';


/* insert grants for 'sb' (all tables except payment, pod, location) */
/* SELECT CONCAT("GRANT insert ON inventar.", table_name, " TO 'sb'@'%';")
FROM information_schema.TABLES
WHERE table_schema = "inventar" AND table_name not in 
("pod","location","payment") AND table_name not like "v\_%";  */
GRANT insert ON inventar.address TO 'sb'@'%';
GRANT insert ON inventar.communication TO 'sb'@'%';
GRANT insert ON inventar.communicationtype TO 'sb'@'%';
GRANT insert ON inventar.credential TO 'sb'@'%';
GRANT insert ON inventar.customer TO 'sb'@'%';
GRANT insert ON inventar.device TO 'sb'@'%';
GRANT insert ON inventar.devicecategory TO 'sb'@'%';
GRANT insert ON inventar.devicemachine TO 'sb'@'%';
GRANT insert ON inventar.deviceprinter TO 'sb'@'%';
GRANT insert ON inventar.devicerouter TO 'sb'@'%';
GRANT insert ON inventar.deviceswitch TO 'sb'@'%';
GRANT insert ON inventar.devicetype TO 'sb'@'%';
GRANT insert ON inventar.devicewlanaccesspoint TO 'sb'@'%';
GRANT insert ON inventar.invoice TO 'sb'@'%';
GRANT insert ON inventar.invoiceposition TO 'sb'@'%';
GRANT insert ON inventar.log TO 'sb'@'%';
GRANT insert ON inventar.mediumtype TO 'sb'@'%';
GRANT insert ON inventar.networkinterface TO 'sb'@'%';
GRANT insert ON inventar.person TO 'sb'@'%';
GRANT insert ON inventar.rate TO 'sb'@'%';
GRANT insert ON inventar.reldevicecredential TO 'sb'@'%';
GRANT insert ON inventar.relnetworkinterface TO 'sb'@'%';
GRANT insert ON inventar.relnetworkinterfacevlan TO 'sb'@'%';
GRANT insert ON inventar.servicetype TO 'sb'@'%';
GRANT insert ON inventar.unit TO 'sb'@'%';
GRANT insert ON inventar.vlan TO 'sb'@'%';
GRANT insert ON inventar.wlanstandard TO 'sb'@'%';


grant execute on procedure inventar.P_LogMessageAdd to 'log'@'%';

grant select on inventar.V_LogEntries to 'tool'@'%';
grant execute on procedure inventar.P_LogClear to 'tool'@'%';

flush privileges;
