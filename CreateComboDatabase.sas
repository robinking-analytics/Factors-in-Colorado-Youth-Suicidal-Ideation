PROC SQL;
DROP TABLE PORT_581.ahrf_co_combo;
CREATE TABLE PORT_581.ahrf_co_combo AS
   SELECT  *
FROM PORT_581.AHRF2019_CO_ABBRV AHRF2019_CO_ABBRV 
FULL JOIN PORT_581.CO_HEALTH CO_HEALTH 
ON 
   ( AHRF2019_CO_ABBRV.f00010 = CO_HEALTH.CountyName ) ; 
QUIT;

