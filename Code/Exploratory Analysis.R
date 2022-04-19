####### EXPLORE THE DATA

#Dimensions of the dataset
print(dim(lamb_ewe))

#Column names
colnames(lamb_ewe)

#Data summary
summary(lamb_ewe)

#Creating Summary Table for Lamb Data
total_summary_lamb<-describe(lamb_ewe, fast = TRUE)
kable(total_summary_lamb, caption = "Summary Statistics of Lamb Dataset")

#Creating Smaller Summary Table for Lamb EWE Ratio
summary_lambratio <- lamb_ewe %>%
  summarise(mean.ratio=mean(lamb_ewe_ratio), minimum.ratio=min(lamb_ewe_ratio), maximum.ratio=max(lamb_ewe_ratio), sd.ratio=sd(lamb_ewe_ratio))

knitr::kable(summary_lambratio, caption = "Lamb EWE Ratio: Summary Table")


#Plot scatterplot matrix 
plot(lamb_ewe)

#Check for normality
shapiro.test(lamb_ewe$lamb_ewe_ratio)


#Plot lamb EWE ratio against time 
explorelambewe<-ggplot(lamb_ewe, aes(x = year, y = lamb_ewe_ratio)) +
  geom_point() +
  labs(x="Time", y = "Lamb EWE Ratio")

plot(explorelambewe)

#Generate histogram of lamb EWE ratio
ggplot(data = lamb_ewe) +
  geom_histogram(mapping = aes(x = lamb_ewe_ratio), binwidth = 0.1, fill="darkblue") +
  labs(x="Lamb EWE Ratio")



