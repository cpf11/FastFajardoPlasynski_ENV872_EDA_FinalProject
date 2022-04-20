### CREATING MODEL & ANALYSIS 
require(stargazer)
require(ggplot2)

#Create preliminary GLM 
lamb_lm <- lm(data = lamb_ewe, lamb_ewe_ratio ~ year + elevation + snow_line_elevation + 
                snow_disappearance + snow_cover_duration + temp + precip + may_temp + winter_precip)

#Summarize model 
summary(lamb_lm)

#Choose best model by AIC in a Stepwise Algorithm
step(lamb_lm)

#Best model selected based off previous step 
new_lamb_lm<-lm(formula = lamb_ewe_ratio ~ snow_cover_duration + temp + may_temp, 
                data = lamb_ewe)

#Summarize model 
summary(new_lamb_lm)

#Generate regression table 
stargazer(new_lamb_lm, title = "Linear Regression Results")


## Plots

#Plot relationship between lamb ewe ratio and snow cover duration 
lamb_snowcoverduration<-ggplot(lamb_ewe, aes(x = snow_cover_duration, y = lamb_ewe_ratio)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE) +
  labs(x="Snow Cover Duration (mean days)", y = "Lamb EWE Ratio")
plot(lamb_snowcoverduration)

#Plot relationship between lamb ewe ratio and temperature 
lamb_temp<-ggplot(lamb_ewe, aes(x = temp, y = lamb_ewe_ratio)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE, col="red") +
  labs(x="Temperature (Cº)", y = "Lamb EWE Ratio")
plot(lamb_temp)

#Plot relationship between lamb ewe ratio and may temperature
lamb_maytemp<-ggplot(lamb_ewe, aes(x = may_temp, y = lamb_ewe_ratio)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE, col="green") +
  labs(x="May Temperature (Cº)", y = "Lamb EWE Ratio")
plot(lamb_maytemp)

#Diagnostic Plots 
par(mfrow = c(2, 2))
plot(new_lamb_lm)

