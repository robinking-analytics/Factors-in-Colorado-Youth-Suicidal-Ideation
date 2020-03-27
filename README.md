# Factors-in-Colorado-Youth-Suicidal-Ideation
SAS Studio, GoogleSheets, and RapidMiner were used to explore publicly available data to identify county-level economic and health factors that are correlated with serious thoughts of suicide among Colorado high school students.  

An exploratory study investigating suicidal ideation among Colorado high school students and various economic and health population-level factors.


## Findings 

See Robin_King_MIS581_Capstone.pdf for study findings.

## Tools

SAS&reg; Studio, RapidMiner, and GoogleSheets.

## Data

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

## Statistics

The data was explored numerically and visually using code in Correlations.sas
