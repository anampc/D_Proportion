
### Code and data to follow the proportion of D1a *Symbiodinium* in Ssid corals over

I want to look at the changes in *Symbiodinium* community composition in replicated cores from six *Siderastrea siderea* colonies over a period of about three years. These cores were repeatedly sampled to estimate the symbiont to host cell ratio and some of them were exposed to one or two heat bleaching events. D proportion decline over time when the corals were maintained at control temperature (26-27C), more slowly under ambient temperature (26-29), and rapidly increased during and after heat stress. 

I want to address for how long this corals stay D dominated without perturbation (if there is not temperature stress). 

#### Repository structure:

1. Data folder: contains all the data and metadata collected from each indivudual core during the experiment

[https://github.com/anampc/D_Proportion/tree/master/data]

   * **data**/qPCR_data.csv: Contains the clade specific (C and D) symbiont to host cell ratios and calculated D proportion
    
        + *Core*: Individual ID for each replicated core used in the experiment (Colony-CoreNumber)
        + *Colony*: Coral host ID
        + *TimePoint*: sequential times in which the samples where collected
        + *Sample.Time*: Individual ID of each sample (TimePoint_Core)
        + *Date*: Date in which the samples were collected (Year-month-day)
        + *C.SH*: Clade C symbiont to host cell ratio
        + *D.SH*: Clade D symbiont to host cell ratio 
        + *Tot.SH*: Clade C + Clade D symbiont to host cell ratio
        + *D.Prp*: Proportion of the symbiont community composed by clade D (D.SH/Tot.SH)
        + *Other Experimental information*: multiple columns describing the experimental history fo the cores, tempearture at each time point etc... have to choose what is important and organise this better
        
   * **data**/YII.data.csv: Contains the Fv/Fm values for each core at each time point
        + *Date*: Date in which the samples were collected (Year-month-day)
        + *Colony*: Coral host ID
        + *TimePoint*: sequential times in which the data was collected
        + *Core*: Individual ID for each replicated core used in the experiment (Colony-CoreNumber)
        + *Sample.Time*: Individual ID of each sample (TimePoint_Core)
        
   * **data**/Tempearture.csv: Contains the temperature and light data for 2 replicated tanks by each treatment
        + *Date_Time*: Original Date-Time from the HOBO sensor (12 hours clock) "yyyy-MM-dd HH:mm:ss aa"
        + *Temp*: Temperature in Centigrades
        + *Lux*: Light intensity in Lux unitis (data not reliable since the sensors get cover by algae with the time)
        + *Treatment*: Experimental Treatment
        + *Replicate*: One of two replicate tanks per Treatment
        
        
   * **data**/Ssid_All_data.csv: Combined qPCR, Fv/Fm and temperature data
        
        
2. Scripts: Code for data exploratin and analysis 


    * qPCRAnalysis.Rmd: R code and some preliminary graphs to explore the D proportion data. Renders to  DataAnalysis.html
        
        [https://github.com/anampc/D_Proportion/blob/master/DataAnalysis.Rmd]
        
        [https://anampc.github.io/D_Proportion/DataAnalysis.html]
        
    * Temperature.R: R code to summarise and plot tempearture data
    
    * Temperature.R: R code to summarise and plot tempearture data
        
        
    * **outputs/:** Graphs and data outputs
        [https://github.com/anampc/D_Proportion/tree/master/outputs]

