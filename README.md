# Factors-in-Colorado-Youth-Suicidal-Ideation
SAS Studio, GoogleSheets, and RapidMiner were used to explore publicly available data to identify county-level economic and health factors that are correlated with serious thoughts of suicide among Colorado high school students. SAS&reg; was used to calculate correlations and to draw several graphs, including histograms, scatterplots, and scatterplot matrices.  

This study is presented on YouTube at: https://www.youtube.com/watch?v=60sk52Xd-IE

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


## Findings 
This study used the latest publicly available health and economic county-level data (as of April 2020) to find
correlations between key **health and economic measures** and the **percentage of Colorado youth
who seriously considered suicide**.
### Economic measures correlated with the percentage of Colorado youth who seriously considered suicide
  * **Moderately negatively correlated:** 
    * Median home value 
    * Percent of housing units with more than one person per room
    
  * **Weakly negatively correlated:** 
    * Median household income
    
  * **Weakly positively correlated:**
    * Percent of related children (5-17 years old) in poverty
    * Percent of children (< 18 years old) below poverty level 
    
  * **Not significantly correlated:** 
    * Rate of poverty
    * Rate of deep poverty 

### Health factors correlated with the percentage of Colorado youth who seriously considered suicide
  * **Moderately positively correlated:** 
    * Markers of poor health among adults (rates of diabetes, obesity, inactivity, self-identified fair or poor health, and hospitalization due to stroke)
    * Poor health among high school students (rates of obesity and asthma)
    * Percentage of high school students who had extended periods of sadness
    * Percentage of high school students who had had sexual intercourse 

  * **Moderately negatively correlated:** 
    * Percentage of students who ate several fruits and vegetables each day
    * Percent of active adults  
    * *Perhaps surprisingly:* 
      * Percentage of adults who reported recent binge drinking
      * Percent of adults who used marijuana recently
      
  * **Weakly negatively correlated:**
    * Percentage of high schoolers who used marijuana 
    
   * **No significant correlations were found for:**
     * Rates of high schoolers’ physical activity 
     * Current cigarette smoking
     * Adults’ current asthma diagnoses

See *Factors_in_Youth_Suicide_Robin_King.pdf* for details about the study.
