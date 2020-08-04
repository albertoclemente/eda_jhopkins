
# boxplot -----------------------------------------------------------------

airquality <- transform(airquality,Month =factor(Month))
with(airquality, boxplot(Ozone ~ Month), ylab="Ozone (ppb)")
