#==========================================
# This script defines function for making
# plot 3. Parameter "save" defines wether
# to save plot on disk as PNG file (default 
# behaviour) or not. Then it runs the 
# function to create PNG. 
#==========================================

buildPlot3 <- function(save = TRUE) {
  # Load data or use cached set
  source("./dataLoader.R")
  
  # Create PNG device only if required to save
  if(save) png(file="plot3.png",width=504,height=504)

  # Remove border if drawn in plot4
  if(save) legend_bty <- "y" else legend_bty <- "n"
  
  pd <- HPC_plotting_data[with(HPC_plotting_data, order(DateTime)),c(7,8,9,10)]
  y_lim <- range(c(pd[,1],pd[,2],pd[,3]))
  colors <- c("black","red","blue")

  plot(pd$DateTime,pd$Sub_metering_1,"l",ylim = y_lim, xlab="",ylab="",col="black")

  par(new = TRUE)
  plot(pd$DateTime,pd$Sub_metering_2,"l",ylim = y_lim, xlab="",ylab="",col="red")

  par(new = TRUE)
  plot(pd$DateTime,pd$Sub_metering_3,"l",ylim = y_lim, xlab="",ylab="Energy sub metering",col="blue")

  legend("topright",legend=c(names(pd)[1:3]),col=colors,lty=1,bty=legend_bty)
  
  # Commit file only if required to save
  if(save) dev.off() 
}
  
buildPlot3()