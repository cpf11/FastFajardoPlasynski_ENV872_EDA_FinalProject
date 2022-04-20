# FastFajardoPlasynski_ENV872_EDA_FinalProject

## Summary

The final project repository for Environmental Data Analytics (ENV 872L) at Duke University, Spring 2022. This final project explores the relationship between environmental conditions and sheep reproductive success.

## Investigators

Marisa Fajardo, Duke University, marisa.fajardo@duke.edu;
Clara Fast, Duke University, clara.fast@duke.edu;
Julia Plasynski, Duke University, julia.plasynski@duke.edu

## Keywords

sheep, populations, environmental conditions, climate change, lambs, conservation, wildlife, mammals, even-toed ungulates, animals, precipitation, atmosphere, temperature, snow cover, biosphere, ecological dynamics, community dynamics, species recruitment, population interactions, climate indicators, ecosystem health

## Database Information

The dataset, Dall Sheep Lamb Recruitment and Climate Data, comes from the Arctic-Boreal Vulnerability Experiment (ABoVE) in Alaska and NW Canada from 2000-2015. The data within this entire dataset originate from different sources. Daily snow was estimated using MODIS imagery, and distance to the center of the sheep range, as well as latitude, longitude, and elevation were gathered from the Global Multi-resolution Terrain Elevation Data 2010. Additionally, monthly gridded climate products from the Scenarios Network for Alaska + Arctic Planning (SNAP), were used to estimate average annual temperature, average May temperatures, total annual precipitation, and total winter (October-April) precipitation. The investigators did not generate new data, but excluded the following variables in this dataset: sheep density, latitude, longitude, and distance. 

## Folder structure, file formats, and naming conventions 

Folders:

- “Code”: contains the data wrangling code, analysis code, and exploratory analysis code.
- “Data”: contains an additional two folders, “Raw” and “Processed,” which contain the raw and processed datasets.
- “Final-report_Files”: contains two folders, “figure-html” and “figure-latex,” which both contain the figures for the report in png and pdf formats.
- “Output”: contains the finished project file (FastFajardoPlasynski_ENV872_Project) in tex, Rmd, and pdf format, the ReadMe file in md and html format, and the project files in a sub-folder called "figure-latex".

The format for the final project is an Rmd file, while the files in the Code folder with the code for our work is an R script. The graphics of the graphs are png and pdf. 

The file names indicate what is included or what action has taken place. For example, the data folder indicates our sheep dataset, but the processed folder shows the action of changing the raw.

## Metadata

Raw Dataset:

- Mountain unit: 14 mountain ranges divided into 24 mountain units for the study; Character
- Year: 2000-2015; Double 
- Surveys: # of surveys; Double 
- Elevation: mean mountain unit elevation; Double; m
- Snow line elevation: elevation on May 15; Double; m
- Snow disappearance: day of year mean; Double 
- Snow cover duration: mean days; Double 
- Temperature: annual average temperature for that year; Double; ºC
- Precipitation: total annual precipitation for that year; Double; mm
- May temperatures: average temperature in May for that year; Double; ºC
- Winter precipitation: total winter (oct-april) precipitation preceding lambing season in that Year; Double; mm
- Latitude: mean mountain unit latitude; Double; decimal degrees
- Longitude: mean mountain unit longitude; Double; decimal degrees
- Distance: distance from center point of each point of each mountain unit to range center; Double; km
- Sheep density: adult sheep/survey area; Double; adult sheep/km2
- Lamb ewe ratio: ratio of lambs to female sheep; Double 

Processed Dataset:

- Mountain unit: 14 mountain ranges divided into 24 mountain units for the study; Character 
- Year: 2000-2015; Date 
- Surveys: # of surveys; Double 
- Elevation: mean mountain unit elevation; Double; m
- Snow line elevation: elevation on May 15; Double; m
- Snow disappearance: day of year mean; Double
- Snow cover duration: mean days; Double
- Temperature: annual average temperature for that year; Double; ºC
- Precipitation: total annual precipitation for that year; Double; mm
- May temperatures: average temperature in May for that year; Double; ºC
- Winter precipitation: total winter (oct-april) precipitation preceding lambing season in that Year; Double; mm
- Lamb ewe ratio: ratio of lambs to female sheep; Double

## Scripts and code

- Analysis.R – Code for the analysis section
- Data Wrangling.R – Code for wrangling data
- Exploratory Analysis.R – Code for the exploratory analysis portion of the project
- FastFajardoPlasynski_ENV872_Project.Rmd– Code for the final report 


## Quality assurance/quality control

For quality control, we removed NAs from the dataset. We also looked at normality, homoscedasticity, linearity, and at outliers.
