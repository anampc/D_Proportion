# library
library(dplyr)
library(ggplot2)
library(ggthemes)

# Data
Temperature<-read.csv("data/Temperature_data.csv", header = T)

Temperature$Tre_1<-as.factor(Temperature$Tre_1)
Temperature$Tank<-as.factor(Temperature$Tank)
Temperature$ID<-paste(Temperature$Tre_1, Temperature$Tank, sep = "_")
Temperature$Date<-as.Date(Temperature$Date_Time, format="%m/%d/%y %H:%M:%S %p")
Temperature$Week<-as.Date(cut(Temperature$Date, breaks = "week"))

# Remove temp data when Mcav was moved to recovery
Mcav<-Temperature[which((Temperature$Tank==1) & ((Temperature$Week=="2016-02-08")|
                                                   (Temperature$Week=="2016-02-15")|
                                                   (Temperature$Week=="2016-02-22"))), ]
Temperature <- droplevels(Temperature[!rownames(Temperature) %in% 
                                        rownames(Mcav), ])

# Check sudden differences in temp
Temperature<-
  (Temperature %>% 
  group_by(ID)  %>% 
  mutate(temp.difference = Temp - lag(Temp)))

Temperature$temp.difference[is.na(Temperature$temp.difference)]<-0
Temperature$Temperature.off<-"OK"
Temperature$Temperature.off[(Temperature$temp.difference>2)]<-"Too Hot"
Temperature$Temperature.off[(Temperature$temp.difference<(-2))]<-"Too Cold"

# Average, min and max Temperature by treatment, tank(Replicate) and week
Summary<-Temperature %>%
  group_by(Tank, Tre_1, Week) %>%
  dplyr::summarise(avgTemp = mean(Temp), maxTemp = max(Temp),  minTemp = min(Temp))
  
# Plot average temperature per week
Temperature_All<- ggplot(Summary, aes (Week, avgTemp)) +
  theme_gdocs() +
  stat_summary(fun.data = "mean_cl_boot",geom = "line") +
  stat_summary(fun.data = "mean_cl_boot",geom = "errorbar") +
  # geom_line() +   
  xlab("Date")  + guides(colour=guide_legend("Period")) +
  ylab("Temperature (C)")
Temperature_All

