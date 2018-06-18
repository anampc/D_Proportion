# libraries 
    library(dplyr)
    library(ggplot2)
    library(ggthemes)

# Data
    Temperature<-read.csv("data/Temperature_data.csv", header = T)
    Temperature$Date<-as.Date(Temperature$Date_Time, format="%m/%d/%y %H:%M:%S %p")
    Temperature$Week<-as.Date(cut(Temperature$Date, breaks = "week"))

    # Remove temp data when Mcav was moved to recovery
    Mcav<-Temperature[which((Temperature$Replicate==1) & ((Temperature$Week=="2016-02-08")|
                                                       (Temperature$Week=="2016-02-15")|
                                                       (Temperature$Week=="2016-02-22"))), ]
    Temperature <- droplevels(Temperature[!rownames(Temperature) %in% 
                                            rownames(Mcav), ])
# --------------------------------
# # Check sudden differences in temp
# Temperature<-
#   (Temperature %>% 
#   group_by(ID)  %>% 
#   mutate(temp.difference = Temp - lag(Temp)))
# 
# Temperature$temp.difference[is.na(Temperature$temp.difference)]<-0
# Temperature$Temperature.off<-"OK"
# Temperature$Temperature.off[(Temperature$temp.difference>2)]<-"Too Hot"
# Temperature$Temperature.off[(Temperature$temp.difference<(-2))]<-"Too Cold"
# --------------------------------

# Average, min and max Temperature by treatment, tank(Replicate) and week
    # Expand time frame
    Dates<-as.data.frame(seq(as.Date("2015-06-30"), 
                             as.Date("2018-06-10"), by="days"))
    names(Dates) <- c("Date")
    Temperature<-merge(Dates, Temperature, on=Dates, all=TRUE)
    Temperature$Week<-as.Date(cut(Temperature$Date, breaks = "week"))
    
    # Summary by week
    Summary<-Temperature %>%
      group_by(Treatment, Replicate, Week) %>%
      dplyr::summarise(avgTemp = mean(Temp), 
                       maxTemp = max(Temp),  
                       minTemp = min(Temp), 
                       sdTemp = sd(Temp))
    
    Temperature<-dplyr::full_join(Temperature, Summary, by=c("Treatment", "Replicate", "Week"))  
    write.csv(Temperature, "Final_Temperature.csv")
    
# Plot average temperature per week
   # tiff('outputs/Temperature.tiff', units="in", width=6, height=4, res=300)
      Temperature_All<- ggplot(Summary, aes (Week, avgTemp)) +
        theme_bw() +
        # stat_summary(fun.data = "mean_cl_boot",geom = "line") +
        stat_summary(fun.data = "mean_cl_boot",geom = "errorbar") +
         geom_line() +   
        scale_x_date(date_breaks = "3 months", date_labels = "%Y-%m", 
                     limits = c(as.Date("2015-06-30"), as.Date("2018-02-10")),
                     name = "Year-month") +
        ylab(expression("Temperature"~(degree*C)))
      Temperature_All
  #  dev.off()