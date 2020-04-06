* Run descriptive analytics on Key Variable PctHSConsiderSuicide;
proc UNIVARIATE;
  VAR PctHSConsiderSuicide;
run;
proc univariate normal plot data=PORT_581.AHRF_CO_COMBO;
var PctHSConsiderSuicide;
Title "Percent of High School Students who Seriously Considered Suicide";
histogram PctHSConsiderSuicide/normal; 
run;

* Look at Histograms for Poverty Factors;
proc univariate normal plot data=PORT_581.AHRF_CO_COMBO;
var PctHSConsiderSuicide medHomValOwnOcc f1483813 MedhouseholdIncome f1332317 PctChildPov ;
histogram /normal; 
run;

* Look at Correlations for Poverty Factors;
proc corr data=PORT_581.AHRF_CO_COMBO spearman ;
	var PctHSConsiderSuicide;
	with medHomValOwnOcc f1483813 MedhouseholdIncome f1332317 PctChildPov F1440813 PctChildFoodStamps F0873810 f0002013_num f1541913   ;
run;

* it looks like there may be a bend at around $360K-370K median value;
* is there a correlation at lower values?;
proc corr data=PORT_581.AHRF_CO_COMBO spearman ;
	Title "Correlation: Suicidal Ideation and Median Home Value below $360K";
	var PctHSConsiderSuicide;
	with medHomValOwnOcc ;
	where medHomValOwnOcc <360000;
run; * results in -0.39731, 0.0032, 53;

proc corr data=PORT_581.AHRF_CO_COMBO spearman ;
	Title "Correlation: Suicidal Ideation and Median Home Value at or above $360K";
	var PctHSConsiderSuicide;
	with medHomValOwnOcc ;
	where medHomValOwnOcc >=360000;
run; * results in -0.69437, 0.0834, 7;

* correlate significant factors with each other;
proc corr data=PORT_581.AHRF_CO_COMBO spearman ;
	var medHomValOwnOcc f1483813 MedhouseholdIncome f1332317 PctChildPov ;
run;

proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Economic Factors";
  matrix PctHSConsiderSuicide medHomValOwnOcc f1483813 MedhouseholdIncome f1332317 PctChildPov ;
run;



*Compare Healthy Factors;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
	var PctHSConsiderSuicide;
	with PctHSProduce PctAdultActive PctHSActive PctChildActive PctChildProduce ;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Positive Health Factors";
  matrix PctHSConsiderSuicide PctHSProduce PctAdultActive  ;
run;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
	var PctHSProduce PctAdultActive ;
run;
* check correlation of sadness and sexual history;

proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Factors Related to Alcohol and Marijuana";
	var PctAdultMJ PctAdultBinge PctHSMJ ;
run;


*Compare Unhealthy Factors;
* skip PctChildAsthma PctChildMHProblems PctChildObese PctChildPoorHealth d/t too few data points ;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Youth Considering Suicide and Unhealthy Factors";
	var PctHSConsiderSuicide;
	with    PctHSSad2Wks PctAdultDiabetes RateHospStroke PctHSSex PctHSCigarettes 
	PctHSObese PctHSAsthma PctAdultBinge PctAdultMJ PctAdultPoorHealth  PctAdultInactive
	PctHSMJ PctAdultObese  PctAdultAsthma  
	 PctHSBinge  PctHSDUI ;
run;
* check correlation of sadness and sexual history;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Youth Considering Suicide and Unhealthy Factors";
	var PctHSSad2Wks PctHSSex ;
run;


* check correlation of adult negative health factors;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Youth Considering Suicide and Unhealthy Factors";
	var PctHSConsiderSuicide PctAdultDiabetes RateHospStroke 
 PctAdultPoorHealth  PctAdultInactive;
run;

* check correlation of significant negative health factors;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Youth Considering Suicide and Unhealthy Factors";
	var PctHSConsiderSuicide PctHSObese PctHSAsthma ;
run;
* check correlation of alcohol, MJ significant factors;
proc corr data=PORT_581.AHRF_CO_COMBO spearman;
  title "Youth Considering Suicide and Unhealthy Factors";
	var PctHSConsiderSuicide PctAdultBinge PctAdultMJ PctHSMJ ;
run;

* , PctAdultMJ  ;
* 7 null pctAdultBinge, 18 null PctAdultMJ;
proc sql ;
select count(*)
from port_581.ahrf_co_combo
where PctHSMJ is null ;
quit;

* scatterplot for alchol and marijuana factors;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Factors Related to Alcohol and Marijuana";
  matrix PctHSConsiderSuicide PctAdultBinge PctAdultMJ PctHSMJ ;
run;
* scatterplot for youth health factors;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Unhealthy Youth Factors";
  matrix PctHSConsiderSuicide PctHSObese PctHSAsthma ;
run;
* scatterplot for adult health factors;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Unhealthy Adult Factors";
  matrix PctHSConsiderSuicide PctAdultDiabetes RateHospStroke PctAdultPoorHealth  
      PctAdultInactive PctAdultObese ;
run;
* scatterplot for sadness and sex;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide, Sadness and Sexual History Factors";
  matrix PctHSConsiderSuicide PctHSSad2Wks PctHSSex;
run;




proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Unhealthy Factors";
  matrix PctHSConsiderSuicide PctHSSad2Wks  PctAdultDiabetes RateHospStroke PctHSCigarettes PctHSObese PctHSAsthma PctAdultBinge PctAdultMJ PctAdultPoorHealth  PctAdultInactive
	PctHSMJ PctAdultObese PctHSSex PctAdultMJ ;
run;
* ADD THIS; 
* Check sex, sadness, and suicide;
proc corr data=PORT_581.AHRF_CO_COMBO pearson ;
  title "Youth Considering Suicide, Sex, and Sadness";
	var PctHSConsiderSuicide PctHSSad2Wks  PctHSSex ;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide, Sex, and Sadness";
  matrix PctHSConsiderSuicide PctHSSad2Wks  PctHSSex ;
run;

proc corr data=PORT_581.AHRF_CO_CO
* ADD THIS; 
* Check alcohol and marijuana stats;
MBO pearson ;
  title "Youth Considering Suicide and Alcohol and Marijuana Factors";
	var PctHSConsiderSuicide  PctAdultBinge PctAdultMJ PctHSMJ PctHSBinge  PctHSDUI ;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Unhealthy Factors";
  matrix PctHSConsiderSuicide  PctAdultBinge PctAdultMJ PctHSMJ PctHSBinge  PctHSDUI ;
run;



ods graphics / reset width=6.4in height=4.8in imagemap;

proc sgplot data=PORT_581.AHRF_CO_COMBO;
	bubble x=medHomValOwnOcc y=PctHSConsiderSuicide size=MedhouseholdIncome/ 
		colorresponse=f1483813 bradiusmin=7 bradiusmax=14;
	xaxis grid;
	yaxis grid;
run;

proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Suicide and Poverty";
  matrix PctHSConsiderSuicide medHomValOwnOcc MedhouseholdIncome f1483813  / group=f1533414;
run;






*Code to get a numeric rural urban continuum code;
proc sql ;
ALTER TABLE PORT_581.AHRF_CO_COMBO
add  f0002013_num num 'Numeric Rural Urban Continuum Code';
quit;
proc sql ;
update PORT_581.AHRF_CO_COMBO
set f0002013_num  = input (f0002013,best.);
quit;




* Full Automatically created code appears below;

ods noproctitle;
ods graphics / imagemap=on;

proc corr data=PORT_581.AHRF_CO_COMBO pearson nosimple noprob plots=none;
	var PctHSSuicideAttempt;
	with f1332317 f1440813 f1483813 medHomValOwnOcc MedhouseholdIncome 
		'NumAdultsNoHealthIns, 2014'n NumChildrenNoHealthIns NumDaysAdultBadPhyH 
		NumDaysAdultHlthImpactAct NumGrpLiving NumHouseLingIsolated 
		PctAbovePovFoodStamps PctAdultActive PctAdultAsthma PctAdultBinge 
		PctAdultInactive PctAdultObese PctAdultOverweightObese PctAdultPoorHealth 
		PctHSActive PctHSAsthma PctHSBinge pctHSCigarettes PctHSDUI PctHSMJ 
		PctHSObese PctHSOverweight PctHSProduce PctHSSad2Wks PctHSSex PctHSUsingBC;
run;

* Run graphs for scatterplots with trend lines;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplots for Youth Considering Suicide with Substance Factors";
  plot (PctHSConsiderSuicide ) * (PctHSMJ PctAdultMJ PctAdultBinge) /reg;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplots for Youth Considering Suicide with Sadness and Sexual History Factors";
  plot (PctHSConsiderSuicide)*(PctHSSad2Wks PctHSSex) / reg;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplots for Youth Considering Suicide and Economic Factors";
  plot (PctHSConsiderSuicide)*(medHomValOwnOcc MedhouseholdIncome f1483813 f1332317 PctChildPov ) / reg;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO ;
  title 'Scatterplots for Youth Considering Suicide and Postive Health Factors';
  plot (PctHSConsiderSuicide)*(PctHSProduce PctAdultActive) / reg;
run;
* check correlation of adult negative health factors;
proc sgscatter data=PORT_581.AHRF_CO_COMBO ;
  title "Youth Considering Suicide and Negative Health Factors for Adults";
  plot (PctHSConsiderSuicide)*(PctAdultDiabetes RateHospStroke  PctAdultPoorHealth  PctAdultInactive PctAdultObese) / reg;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO ;
  title "Youth Considering Suicide and Negative Health Factors for Youth";
  plot (PctHSConsiderSuicide)*(PctHSObese  PctHSAsthma ) / reg ;
run;



* Look into Mental Health Services;
* Compare with Number of Ped Psychs;
proc corr data=PORT_581.AHRF_CO_COMBO pearson ;
	var PctHSConsiderSuicide;
	with RateChildPsych RateChildPsychPtCare RatePsych ;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Psychologists Per Populution";
  matrix PctHSConsiderSuicide RateChildPsych RateChildPsychPtCare RatePsych ;
run;

* See Child Psych Availability;
proc sql;
Select  F00010 ,  F0474817,  F0474815 ,  F0474810 ,  F1116017 ,  F1116015 , F1116010 , 
 F1318717 ,  F1068317 ,  F1319017 , F1069017 
from port_581.ahrf2019
where  F12424 = 'CO'
order by F0474817;
quit;

* There are 45 counties with ZERO for every measure of child mental health services!;
proc sql;
Select  F0002013 , count(*)
from port_581.ahrf2019
where  F12424 = 'CO' 
and  (F0474817=0 and  F0474815 =0 and  F0474810 =0 and  F1116017 =0 
and  F1116015 =0 and F1116010 =0 and  F1318717 =0 and
F1068317 =0 and F1319017 =0 and F1069017=0)
group by F0002013 
order by F0002013 ;
Quit;
* compare counties with and without child mental health services;
proc sql;
Select  'No' 'Services', F0002013 'Contiuum', count(*) 'Count'
from port_581.ahrf2019
where  F12424 = 'CO' 
and  ((F0474817 +F0474815 +F0474810 +F1116017 +F1116015 +F1116010 +F1318717 +F1068317 +F1319017 +F1069017)=0)
group by 1, 2
UNION
Select  'Yes' 'Services', F0002013 'Contiuum', count(*) 'Count'
from port_581.ahrf2019
where  F12424 = 'CO' 
and  ((F0474817+F0474815 +F0474810 +F1116017 +F1116015 +F1116010 +F1318717 + F1068317 +F1319017+F1069017)>0)
group by 1, 2
order by 1, 2;
quit;


quit;
* Look at the counties that do not have ZERO for every measure of child mental health services;
* sort with the lowest total number first;
proc sql;
Select  F00010 , F0002013 , F0474817,  F0474815 ,  F0474810 ,  F1116017 ,  F1116015 , F1116010 
from port_581.ahrf2019
where  F12424 = 'CO' 
and  not(F0474817=0 and  F0474815 =0 and  F0474810 =0 and  F1116017 =0 
and  F1116015 =0 and F1116010 =0 and  F1318717 =0 and
F1068317 =0 and F1319017 =0 and F1069017=0)
order by F0474817 +F0474815 +F0474810 +F1116017 +F1116015 +F1116010 +F1318717 +
F1068317 +F1319017 +F1069017;
quit;

* According to AHRF, Colorado has ZERO:; 
*     Children's Psych ST Hosps 2017;
*	 Children's Psych LT Hosps 2017;

*Compare Mental Health related rates with Suicide;
proc corr data=PORT_581.AHRF_CO_COMBO spearman ;
	var PctHSConsiderSuicide;
	with PctHSSad2Wks f1316615 RateSuicideHospital RateMHHospital;
run;
proc sgscatter data=PORT_581.AHRF_CO_COMBO;
  title "Scatterplot Matrix for Youth Considering Suicide and Overall Suicide Rate";
  matrix PctHSConsiderSuicide PctHSSad2Wks RateMHHospital RateSuicideHospital ;
run;


* Code to add computed fields to table;
* code to add rates of psychs;
proc sql ;
ALTER TABLE PORT_581.AHRF_CO_COMBO
add  RateChildPsych num 'Rate of Pediatric Psychologists';
quit;
proc sql ;
update PORT_581.AHRF_CO_COMBO
set RateChildPsych = f0474817/f1198418 ;
quit;
proc sql ;
ALTER TABLE PORT_581.AHRF_CO_COMBO
add  RateChildPsychPtCare num 'Rate of Child Psych, Total Patn Care';
quit;
proc sql ;
update PORT_581.AHRF_CO_COMBO
set RateChildPsychPtCare = f1116017/f1198418 ;
quit;
proc sql ;
ALTER TABLE PORT_581.AHRF_CO_COMBO
add  RatePsych num 'Rate of Psychologists';
quit;
proc sql ;
update PORT_581.AHRF_CO_COMBO
set RatePsych = f0477317/f1198418 ;
quit;