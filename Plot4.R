source("ReadData.R")
tgtdata <- ReadData()
plot_colors <- c("black","red","blue")
plot_labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
y_max <- max(c(tgtdata$Sub_metering_1,tgtdata$Sub_metering_2,tgtdata$Sub_metering_3))

makePlotA <- function(){
  plot(tgtdata$Date, 
       tgtdata$Global_active_power, 
       ylab="Global Active Power",
       xlab="", 
       type="l",
       xaxt="n")
  axis.POSIXct(1,x=tgtdata$Date)
}
makePlotB <- function(){
  with(tgtdata, {
    plot(Date, Voltage, type="l", xaxt="n")
    axis.POSIXct(1,x=tgtdata$Date)  
    title(main="", xlab = "datetime", ylab="Voltage")
  })
}
makePlotC <- function(){
  with(tgtdata, {
    plot(Date, Sub_metering_1, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[1], xlab = "", ylab = "")
    lines(Date, Sub_metering_2, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[2])
    lines(Date, Sub_metering_3, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[3])
    axis.POSIXct(1,x=tgtdata$Date)  
    legend("topright", plot_labels, col=plot_colors, lty=1, bty="n")
    title(main="", xlab = "", ylab="Energy sub metering")
  })
}
makePlotD <- function(){
  with(tgtdata, {
    plot(Date, Global_reactive_power, type="l", xaxt="n", xlab = "")
    axis.POSIXct(1,x=tgtdata$Date, xlab = "")  
    title(main="", xlab = "datetime")
  })
}
makePlot4 <- function(){
  par(mfrow=c(2, 2))
  makePlotA()
  makePlotB()
  makePlotC()
  makePlotD()
}


makePlot4()

png(filename = "Plot 4.png", width = 480, height = 480)
makePlot4()
dev.off()



