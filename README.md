# Factors-in-Colorado-Youth-Suicidal-Ideation
SAS Studio, GoogleSheets, and RapidMiner were used to explore publicly available data to identify county-level economic and health factors that are correlated with serious thoughts of suicide among Colorado high school students.  

An exploratory study investigating suicidal ideation among Colorado high school students and various economic and health population-level factors.


## FINDINGS 

See Robin_King_MIS581_Capstone.pdf for study findings.

### Abstract

This study used the latest publicly available health and economic county-level data to find correlations between key health and economic measures and the percentage of Colorado youth who seriously considered suicide. Median home, median household income, and percent of housing units with more than one person per room were moderately negatively correlated. The percent of related children (5-17 years old) in poverty and the percent of children (< 18 years old) below poverty level were weakly positively correlated. Conversely, rates of poverty and deep poverty were not significantly correlated. Several health factors were moderately positively correlated, including markers of poor health among adults (rates of diabetes, obesity, inactivity, self-identified fair or poor health, and hospitalization due to stroke), poor health among high school students (rates of obesity and asthma), the percentage of high school students who had extended periods of sadness, and the percentage of high school students who had had sexual intercourse. Perhaps surprisingly, this study found that the percentage of adults who reported recent binge drinking and the percent of adults who used marijuana recently were moderately negatively correlated, while the percent of high schoolers who used marijuana recently was weakly negatively correlated. Finally, the percentage of students who ate several fruits and vegetables each day and the percent of active adults were both moderately negatively correlated. No significant correlations were found for rates of high schoolers’ physical activity or current cigarette smoking or for adults’ asthma diagnosis.

## TOOLS

SAS Studio, RapidMiner, and GoogleSheets.

## DATA

Data from two key sites were used:

### The United States Health Resources and Services Administration

- County-level Area Health Resources Files were downloaded from: https://data.hrsa.gov/data/download

- Colorado data was extracted with SAS: ExtractCOahrf.sas

- Technnical documentation is posted, with a tab showing fields that were used in this study: AHRF 2018-2019 Technical Documentation with my selected fields.xlsx

### Colorado Department of Public Health and Environment Colorado Health Indicators

- Data was retrieved from: https://www.colorado.gov/pacific/cdphe/colorado-health-indicators

-  Several files were assembled and short indicator labels were added.

- The composite file is posted: Colorado Health Data.xlsx

### Composite Database

- The data was combined into a single file using SAS: CreateComboDatabase.sas

- The composite database is posted as: ahrf-cohealth-combo.csv

- Labels for signficantly correlated variables were added with AddLabels.sas

## STATISTICS

The data was explored in a variety of ways using code in Correlations.sas
