#==========================================
# This script defines function for making
# plot 2. Parameter "save" defines wether
# to save plot on disk as PNG file (default 
# behaviour) or not. Then it runs the 
# function to create PNG. 
#==========================================

buildPlot2 <- function(save = TRUE) {

  # Load data or use cached set
  source("./dataLoader.R")
  
  # Create PNG device only if required to save
  if (save) png(file="plot2.png",width=504,height=504)
  
  # Label differs in separate and combined plot. Typo or purpose?
  y_label <- "Global Active Power"
  if(save) y_label <- paste(y_label,"(kilowatts)")
  
  # TODO: beautify
  pd <- HPC_plotting_data[with(HPC_plotting_data, order(Date,Time)),c(3,10)]
  plot(pd$DateTime,pd$Global_active_power,"l",xlab="",ylab=y_label)

  # Commit file only if required to save
  if (save) dev.off() 
}

buildPlot2()