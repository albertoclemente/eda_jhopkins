
# 1.Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of the years 
#1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
library(tidyverse)

#total amount of PM2.5 per year
pm25 <- 
        NEI %>% 
        group_by(year) %>% 
        summarize(total_pm25 = sum(Emissions))

#generating plot1 
with(pm25,
     barplot(total_pm25/10^6 ~ year, col = "green", 
          xlab="Year", ylab = "Total PM2.5 (tons * 10^6)")) #the total amount of PM2.5 decreased from 1999 to 2008
title (main= "Total amount of PM2.5 from 1999 to 2008")

dev.copy(png,"plot1.png")
dev.off()



# 2. Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
library(tidyverse)

#Total PM2.5 in Baltimore per year
pm25_Baltimore <- 
        NEI %>% 
        filter(fips==24510) %>% 
        group_by(year) %>% 
        summarize(total_pm25_Baltimore = sum(Emissions))

##generating plot2
with(pm25_Baltimore,
     barplot(total_pm25_Baltimore ~ year, col = "blue", 
          xlab="Year", ylab = "Total PM2.5 (tons)")) #the total amount of PM2.5 decreased from 1999 to 2008
title (main= "Total amount of PM2.5 in Baltimore from 1999 to 2008")

dev.copy(png,"plot2.png")
dev.off()


# 3.Of the four types of sources indicated by the 
# (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
library(tidyverse)


##subsetting total PM2.5 for each source
pm25_Baltimore_source <- 
        NEI %>% 
        filter(fips==24510) %>% 
        group_by(type,year) %>% 
        summarize(total_pm25_source=sum(Emissions)) %>% 
        ungroup() 


##generating plot #3 
plot3 <- 
        ggplot(pm25_Baltimore_source,aes(factor(year),total_pm25_source)) +
        geom_bar(stat = "identity",aes(fill=type)) +
        facet_wrap(. ~ type, scales = "free") +
        xlab("Year")+
        ylab("Total PM2.5 (Tons)") +
        ggtitle("Total PM2.5 in Baltimore for each source from 1999 to 2008") #non-road,nonpoint,on-road descreased while point increased

with(plot3,dev.copy(png,"plot3.png", width = 480, height = 480))

dev.off()

#4.Across the United States, 
#how have emissions from coal combustion-related sources 
#changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(tidyverse)


##looking for emissions 
#from coal combustion-related sources

combustion.coal <- 
        grepl("Fuel Comb.*Coal", SCC$EI.Sector)

combustion.coal.sources <-
        SCC[combustion.coal,]

emissions.coal.combustion <- 
        NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]


##calculating the total amount of emissions 1999-2008
total.coal.emissions <- 
        emissions.coal.combustion %>% 
        group_by(year) %>% 
        summarize(total.emissions = sum(Emissions))

plot4 <- 
        ggplot(total.coal.emissions,aes(factor(year),total.emissions/10^5))+
        geom_bar(stat="identity", fill ="blue", col = "red")+
        xlab("Year")+
        ylab("Total PM2.5 emissions (10^5 * Tons)")+
        ggtitle("Total PM2.5 coal-related emissions in the US from 1999 to 2008")
        

with(plot4,dev.copy(png,"plot4.png", width = 480, height = 480))

dev.off()


#5.How have emissions from motor vehicle sources 
#changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(tidyverse)


#filtering emissions from   Baltimore city
vehicles <- 
        grepl("vehicle",SCC$SCC.Level.Two, ignore.case=TRUE)

vehicles.SCC <- 
        SCC[vehicles,]

vehicles.NEI <- 
        NEI[NEI$SCC %in% vehicles.SCC$SCC,]


vehiclesBaltimore <- 
        vehicles.NEI %>% 
        filter(fips == "24510") %>% 
        group_by(year) %>% 
        summarize(Total.VehEmis.Baltimore = sum(Emissions))

##generating the plot
plot5 <- 
        ggplot(vehiclesBaltimore,aes(factor(year),Total.VehEmis.Baltimore))+
        geom_bar(stat="identity", aes(fill = Total.VehEmis.Baltimore)) +
        labs(fill = "PM2.5 emissions (Tons)")+
        xlab("Year")+
        ylab(expression("Total PM" [2.5]*"emissions (Tons)"))+
        ggtitle("PM2.5 emissions from motor vehicles from 1999 to 2008 in Baltimore")

with(plot5,dev.copy(png,"plot5.png", 
                    width = 480, height = 480))

dev.off()






        














