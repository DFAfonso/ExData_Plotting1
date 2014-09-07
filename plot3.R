# Beginning code for this script - plot3.R - is identical to plot2.R so if there are any questions about these first few lines
# of code, please refer to the comments in plot2.R


full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

dataUsed <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

require(lubridate)

DayOfWeek <- factor(wday(dmy(dataUsed$Date),label=TRUE))

png(file = "plot3.png") # png file created with the png() function, which automatically defaults to
#                         a resolution of 480x480 (as requested in the assignment)


# This graph is built up over several steps:

# 1.  Plot is created, label of y-axis added, and first data (Sub_metering_1 is added)
scatPlot <- plot(as.numeric(dataUsed$Sub_metering_1),xaxt="n" ,type="l", xlab ="", 
                 ylab= "Energy sub metering")

# 2.  Sub_metering_2 data is added to plot and colored "red"
scatPlot <- scatPlot + lines(as.numeric(dataUsed$Sub_metering_2),xaxt="n" ,type="l", xlab ="", col="red")

# 3.  Sub_metering_3 data is added to plot and colored "blue"
scatPlot <- scatPlot + lines(as.numeric(dataUsed$Sub_metering_3),xaxt="n" ,type="l", xlab ="", col="blue")

# 4.  Legend is added in the upper right corner
scatPlot <- scatPlot + legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                              col = c("black", "red", "blue"), lty = 1)

# 5.  Values on x-axis added via axis() and manipulation of length of DayOfWeek variable created above.  Further
#     info on this step is available in plot2.R script file.
scatPlot <- scatPlot + axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))


dev.off() # closed the device call to png
