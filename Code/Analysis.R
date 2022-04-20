### CREATING MODEL & ANALYSIS 


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

#Generate model table 
lm(formula = lamb_ewe_ratio ~ snow_cover_duration + temp + may_temp, 
   data = lamb_ewe) %>%
  tidy() %>%
  kable(caption = "Linear Regression Results")


