
# simple plot (base package) ----------------------------------------------
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")

# generating a plot saved as a PDF file -----------------------------------
pdf("myplot.pdf")
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.off()

# copying the plot to another graphic device --------------------------------------------------------

with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.copy(png,"geyserplot.png")
dev.off()




