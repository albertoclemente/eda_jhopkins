#Case study Air Pollution
## US Counties exceeding the National Standard for fine particle pollution

#importing the data
pollution <- read_csv("/Users/albertoclemente/Desktop/DATA SCIENCE/DATA SCIENCE SPECIALIZATION/EDA/data/avgpm25.csv")

#first look at the data
str(pollution)

#five-number summary
fivenum(pollution$pm25)
summary(pollution$pm25)

#boxplot
boxplot(pollution$pm25, col="red") #I can detect outliers

#looking directly at outliers 
pollution %>% 
        filter(pm25 >15)

boxplot(pollution$pm25)$out

#let's localise the outliers on a map
map("county", "california")
with(filter(pollution, pm25 > 15), points(longitude, latitude))

#histogram
hist(pollution$pm25, col="green")
rug(pollution$pm25)

hist(pollution$pm25, col="green", breaks = 100)
rug(pollution$pm25)

#adding abline to the plot
boxplot(pollution$pm25, col="red")
abline(h=12)

#histogram with median & national standard 
hist(pollution$pm25, col="yellow")
abline(v=12,lwd =2)
abline(v=median(pollution$pm25),lwd =4,col="magenta")

#barplot for categorical variables such as region 
table(pollution$region) %>% 
        barplot(col="green")

#relationship between two variables, boxplots
boxplot(pm25 ~ region, pollution, col ="green")

#scatterplot
with(pollution,plot(latitude,pm25,col= region))
abline(h = 12, lwd = 2, lty = 2)

#lattice
xyplot(pm25 ~ latitude | region, pollution )

#ggplot2
qplot(latitude ~ pm25, pollution, facets = . ~ region) 



