#==========================================
# This script makes cache of plotting data
# If cache already exists it does nothing
# Otherwise it downloads zip and extracts
# and filters data
#==========================================


if (exists("HPC_plotting_data")) {} else HPC_plotting_data <- NULL

dataLoader <- function() {
  
  if(is.null(HPC_plotting_data)) { # If cache not yet exist

    # Subdirectory for all data manipulations
    dataDir = "./data" 
    
    # URL for source data zip file
    dataUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    # Zip file name
    zipFn = paste(dataDir,"/source.zip",sep="")
    
    # Data file name
    dataFn = "household_power_consumption.txt"
    
    # Ensures that data subdir exists
    # TODO: Add error processing
    if (!file.exists(dataDir)){
      print("Creating data dir")
      dir.create(file.path(dataDir))
    }
    
    # Download zip file if not exists
    # TODO: Add error processing 
    if (!file.exists(zipFn)){
      print("Downloading plotting data file")
      download.file(dataUrl,zipFn,method="curl")
    }
  
    # Open connection to zip file
    con <- unz(zipFn,dataFn)
       
    # Build data set
    # TODO: beautify
    hcp <- read.table(con,TRUE,";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    hcp <- hcp[(hcp$Date == "1/2/2007") | (hcp$Date == "2/2/2007"),]

    # Add column with true timestamp
    hcp$DateTime <- as.POSIXlt(paste(hcp$Date,hcp$Time),"","%d/%m/%Y %H:%M:%S")
    
    # Put data to upper environment
    HPC_plotting_data <<- hcp

  } else {
    # print("Using cached plotting data ...")
  }
  
}

dataLoader()

