ReadData <- function(){
  library(readr)
  setwd("D:/Desktop/Data Science Classes/Exploratory Data Analysis/ExData_Plotting1")
  sourceUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  localFile <- "household_power_consumption.zip"
  dataFile  <- "household_power_consumption.txt"
  filteredData <- "filtered"
  if ( !file.exists(localFile)) download.file(sourceUrl,localFile)
  if ( !file.exists(dataFile )) utils::unzip(localFile)

  ## 8 bytes each column (20 bytes for string date?), -> 84 bytes per row.
  ## 2,075,259 rows x 84 bytes per row -> 166 MBytes.
  ## Want to read only 2007-02-01 and 2007-02-02

  tmp <- readr::read_delim(
                            file=dataFile,
                            delim = ";",
                            col_types = "ccddddddd",
                            col_names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                            na = "?",
                            skip = 66637, 
                            n_max = 2880
                            )
  
  tmp$Date <- as.POSIXlt(tz="GMT", x=strptime(paste(tmp$Date,tmp$Time),format = "%d/%m/%Y %H:%M:%S"))
  tmp$Time <- NULL

  tmp
}

