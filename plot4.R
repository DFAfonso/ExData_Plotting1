# Beginning code for this script - plot4.R - is identical to plot2.R so if there are any questions about these first few
# lines of code, please refer to the comments in plot2.R


full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

dataUsed <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

require(lubridate)

DayOfWeek <- factor(wday(dmy(dataUsed$Date),label=TRUE))


# Adjusted par settings to allow 4 plots in one file (filled column wise), then reduced the font size slightly with
# cex as it was too crowded otherwise
par(mfcol=c(2,2))
par(cex = 0.7)


# General note about the plots below.   While some plots appear almost identical to the ones created previously in 
# plot2.R and plot3.R, several small changes were made.   Specifically in the "Legend" sizing and positioning, as well as
# in some of the titles to match as closely as possible with the example given by the instructor, while at the same
# time fitting in the 480x480 dimensions requested by the assignment for the png file.

# Plot in position 1,1

gActivePlot <- plot(as.numeric(dataUsed$Global_active_power),xaxt="n" ,type="l", xlab ="", 
        ylab= "Global Active Power") +
        axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))


# Plot in position 2,1 (this one was divided into multiple steps - similar to plot3.R script, 
# as it is the most complex plot)

eSubMeteringPlot <-  plot(as.numeric(dataUsed$Sub_metering_1),xaxt="n" ,type="l", xlab ="", 
                                     ylab= "Energy sub metering")

eSubMeteringPlot <- eSubMeteringPlot + lines(as.numeric(dataUsed$Sub_metering_2),xaxt="n" ,type="l", xlab ="", col="red")

eSubMeteringPlot <- eSubMeteringPlot + lines(as.numeric(dataUsed$Sub_metering_3),xaxt="n" ,type="l", xlab ="", col="blue")


eSubMeteringPlot <- eSubMeteringPlot + legend("top", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                                              col = c("black", "red", "blue"), lty = 1, bty = "n", cex =1.2)

eSubMeteringPlot <- eSubMeteringPlot + axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))


# Plot in  position 1,2

voltagePlot <- plot(dataUsed$Voltage, type="l", xaxt="n",xlab="datetime", ylab="Voltage") +
        axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))

# Plot in position 2,2

gReactivePlot <- plot(as.numeric(dataUsed$Global_reactive_power),xaxt="n" ,type="l", xlab ="datetime", 
        ylab= "Global_reactive_power") +
        axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))


dev.copy(png, file="plot4.png") #this copies the plot from the display device to a png file
dev.off() # this closes the png file device




