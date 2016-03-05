source("ReadData.R")
par(mfrow=c(1,1))
tgtdata <- ReadData()

makePlot2 <- function(){
plot(tgtdata$Date, 
     tgtdata$Global_active_power, 
     ylab="Global Active Power (kilowatts)",
     xlab="", 
     type="l",
     xaxt="n")
axis.POSIXct(1,x=tgtdata$Date)
}

makePlot2()

png(filename = "Plot 2.png", width = 480, height = 480)
makePlot2()
dev.off()
