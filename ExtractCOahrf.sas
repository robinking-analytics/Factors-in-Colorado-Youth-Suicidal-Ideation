proc sql;
create table Port_581.ahrf2019_CO as 
   select * from Port_581.ahrf2019
   where f12424="CO";
quit;

proc export data=Port_581.ahrf2019_CO
outfile='/home/robinking0/MIS 581/Portfolio/ahrf2019_CO_CSV.CSV'
dbms=csv
replace;
run;


