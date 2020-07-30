#importing the data 
library(tidyverse)

ozone <- read_csv("/Users/albertoclemente/Desktop/DATA SCIENCE/DATA SCIENCE SPECIALIZATION/EDA/hourly_44201_2014.csv")

#variable names 
names(ozone)

#change variable names
names(ozone) <- make.names(names(ozone))
names(ozone)
