#base plot #1

data(airquality
     )

with(airquality, {
        plot(Temp, Ozone)
        lines(loess.smooth(Temp,Ozone))
})

#base plot #2

with(cars,plot(speed,dist))

#Lattice system
library(lattice)

state <- data.frame(state.x77, region = state.region )

xyplot(Life.Exp ~ Income | region, state, c(4,1))


#ggplot2

library(ggplot2)
data(mpg)

qplot(displ,hwy,data =mpg)
