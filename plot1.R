#==========================================
# This script defines function for making
# plot 1. Parameter "save" defines wether
# to save plot on disk as PNG file (default 
# behaviour) or not. Then it runs the 
# function to create PNG. 
#==========================================

buildPlot1 <- function(save = TRUE) {

  # Load data or use cached set
  source("./dataLoader.R")
  
  # Create PNG device only if required to save
  if (save) png(file="plot1.png",width=504,height=504)
  
  # Draw plot using cached file
  hist(HPC_plotting_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  
  # Commit file only if required to save
  if (save) dev.off() 

}

# Build plot and save it to disk
buildPlot1()
