
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

#Plot dataset
plot(lamb_ewe_wrangle)

#Models

lamb_lm <- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + elevation + snow_line_elevation + 
              snow_disappearance + snow_cover_duration + temp + precip + may_temp + winter_precip)

summary(lamb_lm)
#Choose model by AIC in a Stepwise Algorithm
step(lamb_lm)


new_lamb_lm<-lm(formula = lamb_ewe_ratio ~ year + precip, data = lamb_ewe_wrangle)

summary(new_lamb_lm)

#Backwards stepwise regression

#Take out snow cover duration
lamb_lm1<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + elevation + snow_line_elevation + 
                snow_disappearance + temp + precip + may_temp + winter_precip)

summary(lamb_lm1)

#Take out elevation
lamb_lm2<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + snow_line_elevation + 
                snow_disappearance + temp + precip + may_temp + winter_precip)

summary(lamb_lm2)

#Take out snow line elevation
lamb_lm3<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + 
                snow_disappearance + temp + precip + may_temp + winter_precip)

summary(lamb_lm3)

#Take out snow disappearance
lamb_lm4<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + temp + precip + may_temp + winter_precip)

summary(lamb_lm4)

#Take out may temperature
lamb_lm5<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + temp + precip + winter_precip)

summary(lamb_lm5)

#Take out temperature
lamb_lm6<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + precip + winter_precip)

summary(lamb_lm6)

#Take out winter precipitation
lamb_lm7<- lm(data = lamb_ewe_wrangle, lamb_ewe_ratio ~ year + precip)

summary(lamb_lm7)

AIC(lamb_lm, lamb_lm7)


#Scatterplots, lamb_ewe versus precipitation

#Scatterplots, lamb_ewe versus year



