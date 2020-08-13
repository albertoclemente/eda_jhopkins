
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

