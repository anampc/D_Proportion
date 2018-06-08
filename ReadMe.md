
### Code and data to follow the proportion of D1a *Symbiodinium* in Ssid corals over

I want to look at the changes in *Symbiodinium* community composition in replicated cores from six *Siderastrea siderea* colonies over a period of about three years. These cores were repeatedly sampled to estimate the symbiont to host cell ratio and some of them were exposed to one or two heat bleaching events. D proportion decline over time when the corals are maintained at control temperature (26-27C), but rapidly increased during and after heat stress. 

I want to address for how long this corals stay D dominated without perturbation (if there is not temperature stress) or 

#### Data strecture:

* data/qPCR_data.csv: Contains the clade specific (C and D) symbiont to host cell ratios and calculated D proportion
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
 
* **scripts/:** R code and some preliminary graphs to explore the data
* **scripts/:** Did something good?? Save it here!