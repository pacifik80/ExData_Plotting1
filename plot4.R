#==========================================
# This script defines function for making
# plot 4. In order to do this all previous
# scripts are re-used.
#==========================================

# Load and cache data
source("./dataLoader.R")

# Build plots 1,2,3
source("./plot1.R")
source("./plot2.R")
source("./plot3.R")

# Init PNG device
png(file="plot4.png",width=504,height=504)

# Build composition
par(mfcol = c(2,2))

buildPlot2(FALSE)
buildPlot3(FALSE)

with(HPC_plotting_data, {
  plot(DateTime,Voltage,"l",xlab="datetime",ylab="Voltage");
  plot(DateTime,Global_reactive_power,"l",xlab="datetime") }
  )

# Commit PNG
dev.off() 