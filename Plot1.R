source("ReadData.R")
par(mfrow=c(1,1))
tgtData <- ReadData()

makePlot1 <- function(){
  hist(tgtdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
}
makePlot1()

png(filename = "Plot 1.png", width = 480, height = 480)
makePlot1()
dev.off()

