
# boxplot -----------------------------------------------------------------
airquality <- transform(airquality,Month =factor(Month))
with(airquality, boxplot(Ozone ~ Month), ylab="Ozone (ppb)")

# Scatterplot -------------------------------------------------------------
with(airquality,plot(Wind,Ozone))

#Subsetting 
with(subset(airquality,Month == 5),
    points(Wind,Ozone,col ="blue"))


# Multiple base plots -----------------------------------------------------
par(mfrow =c(1,2))
with(airquality, {plot(Wind,Ozone, main="Ozone and Wind")
        plot(Solar.R,Ozone, main ="Ozone and Solar Radiation")
        
})
