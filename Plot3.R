source("ReadData.R")
par(mfrow=c(1,1))
tgtdata <- ReadData()
plot_colors <- c("black","red","blue")
plot_labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
y_max <- max(c(tgtdata$Sub_metering_1,tgtdata$Sub_metering_2,tgtdata$Sub_metering_3))

makePlot3 <- function(){
  with(tgtdata, {
    plot(Date, Sub_metering_1, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[1], xlab = "", ylab = "")
    lines(Date, Sub_metering_2, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[2])
    lines(Date, Sub_metering_3, type="l", xaxt="n",ylim = c(0,y_max), col=plot_colors[3])
    axis.POSIXct(1,x=tgtdata$Date)  
    legend("topright", plot_labels, col=plot_colors, lty=1, bty="o", plot = TRUE)
    title(main="", xlab = "", ylab="Energy sub metering")
  })
}

makePlot3()

png(filename = "Plot 3.png", width = 480, height = 480)
makePlot3()
dev.off()



