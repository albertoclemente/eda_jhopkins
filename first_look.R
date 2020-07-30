#importing the data 
library(tidyverse)

ozone <- read_csv("/Users/albertoclemente/Desktop/DATA SCIENCE/DATA SCIENCE SPECIALIZATION/EDA/hourly_44201_2014.csv")

#variable names 
names(ozone)

#change variable names
names(ozone) <- make.names(names(ozone))
names(ozone)

#variables classes
str(ozone)

#How many States?
ozone %>% 
        select(State.Name) %>% 
        unique %>% 
        nrow
#Why are there 53 States? Check the names

unique(ozone$State.Name)
