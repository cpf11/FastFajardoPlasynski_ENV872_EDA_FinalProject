
require(lubridate)
require(tidyverse)

# Load your datasets
lamb_ewe <- read.csv("./Data/Raw/lamb_ewe_ratios_by_mountainunit.csv")

#Change year to date class
lamb_ewe$year<-as.factor(lamb_ewe$year)

#Wrangle Dataset - Take out surveys, sheep density, distance, longitude + latitude 
lamb_ewe_wrangle<- lamb_ewe %>%
  drop_na (snow_line_elevation) %>%
  select(mountain_unit, year, lamb_ewe_ratio, elevation, snow_line_elevation, 
         snow_disappearance, snow_cover_duration, temp, precip, 
         may_temp, winter_precip) 

lamb_ewe_wrangle

write.csv(lamb_ewe_wrangle, row.names = FALSE,
          file = "./Data/Processed/lamb_ewe_wrangle.csv")








