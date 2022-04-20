####### EXPLORE THE DATA
require(lubridate)
require(tidyverse)
require(ggplot2)
require(dplyr)
require(knitr)
require(broom)
require(psych)
require(stargazer)

#Processed dataset information

Column name | Description | Class of data | Unit
------------- | ------------- | ------------- | ------------- 
  Mountain unit | 14 mountain ranges divided into 24 mountain units for the study | Character |
  Year  | 2000-2015 | Date |
  Surveys | # of surveys |Double |
  Elevation | Mean mountain unit elevation | Double | m
Snow line elevation | Elevation on May 15 | Double | m
Snow disappearance | day of year mean  | Double |
  Snow cover duration | mean days  | Double |
  Temperature | Annual average temperature for that year | Double | ºC
Precipitation | total annual precipitation for that year | Double | mm
May temperatures | Average temperature in May for that year | Double | ºC
Winter precipitation | Total winter (oct-april) precipitation preceding lambing season in that Year | Double | mm
Lamb ewe ratio | ratio of lambs to female sheep | Double |


#Dimensions of the dataset
print(dim(lamb_ewe))

#Column names
colnames(lamb_ewe)

#Data summary
summary(lamb_ewe)

#Creating Summary Table for Lamb Data
total_summary_lamb<-describe(lamb_ewe, fast = TRUE)
knitr::kable(total_summary_lamb, caption = "Summary Statistics of Lamb Dataset", digits = c(0, 0, 0, 3, 3, 3, 3, 3, 3))

#Creating Smaller Summary Table for Lamb EWE Ratio
summary_lambratio <- lamb_ewe %>%
  summarise(mean.ratio=mean(lamb_ewe_ratio), minimum.ratio=min(lamb_ewe_ratio), maximum.ratio=max(lamb_ewe_ratio), sd.ratio=sd(lamb_ewe_ratio))
knitr::kable(summary_lambratio, caption = "Lamb EWE Ratio: Summary Table")

#Check for normality
shapiro.test(lamb_ewe$lamb_ewe_ratio)

## PLOTS

#Plot scatterplot matrix 
plot(lamb_ewe)

#Plot lamb EWE ratio against time 
explorelambewe<-ggplot(lamb_ewe, aes(x = year, y = lamb_ewe_ratio)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE, col="green") +
  labs(x="Time", y = "Lamb EWE Ratio")

plot(explorelambewe)

#Generate histogram of lamb EWE ratio
ggplot(data = lamb_ewe) +
  geom_histogram(mapping = aes(x = lamb_ewe_ratio), binwidth = 0.1, fill="darkblue") +
  labs(x="Lamb EWE Ratio")



