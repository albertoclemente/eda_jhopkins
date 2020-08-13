
SCC <- readRDS("Source_Classification_Code.rds")


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
     plot(year,total_pm25,pch=19, col = "red", 
          xlab="Year", ylab = "Total PM2.5 (tons)"))
with(pm25,
     lines(year,total_pm25,col="blue", lwd=2)) #the total amount of PM2.5 decreased from 1999 to 2008
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
     plot(year,total_pm25_Baltimore,pch=19, col = "blue", 
          xlab="Year", ylab = "Total PM2.5 (tons)"))

with(pm25_Baltimore,
     lines(year,total_pm25_Baltimore,col="green", lwd=2)) #the total amount of PM2.5 decreased from 1999 to 2008
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

pm25_Baltimore_source <- 
        NEI %>% 
        filter(fips==24510) %>% 
        group_by(type,year) %>% 
        summarize(total_pm25_source=sum(Emissions)) %>% 
        ungroup() 

plot3 <- 
        ggplot(pm25_Baltimore_source,aes(year,total_pm25_source)) +
        geom_point(size=2, col="blue") +
        geom_line(col= "red") +
        facet_wrap(. ~ type) +
        xlab("Year")+
        ylab("Total PM2.5 (tons)") +
        ggtitle("Total PM2.5 in Baltimore for each source from 1999 to 2008") #non-road,nonpoint,on-road descreased while point increased

with(plot3,dev.copy(png,"plot3.png", width = 480, height = 480))

dev.off()

        










