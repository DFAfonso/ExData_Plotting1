# read in the data - it's in a text file with a ";" separator, in the current working directory
## Note, this file is 129,845 KB, and R reads it entirely into RAM


full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#subset out the dates requested - format in file is in dd/mm/yyyy

dataUsed <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

# As Date manipulation is required in this part of the assignment, I will be loading the lubridate package as it
# allows for much easier date manipulation within R.
# If lubridate package needs to be downloaded it can be done with:
# install.packages("lubridate")

require(lubridate)


# wday returns the day of the week as a number (Sunday is 1), setting label = True returns the name of the day
# i.e. Thurs, Fri, etc.... 
# dmy is also used to ensure the format is read as day, month, year (the lubridate package does this relatively
# intelligently)

DayOfWeek <- factor(wday(dmy(dataUsed$Date),label=TRUE))


# A few notes about the plotting below:
# 1.  the x-axis would have defaulted to the numeric index values of the rows in the dataset (dataUsed), but
#     this was overwritten to be blank (xaxt = "n") to allow for the days of the week to be added later with axis()
# 2.  The DayOfWeek variable (created above), has values of "Thurs" & "Fri", and is divided equally amongst
#     the 2880 values (i.e. first half - 1440 - are for "Thurs", second half are for "Fri").  When assigning the
#     axis values of "Thu", "Fri" and "Sat", these were then set according to the length of this data set.


png(file = "plot2.png") # png file created with the png() function, which automatically defaults to
                        # a resolution of 480x480 (as requested in the assignment)

scatPlot <- plot(as.numeric(dataUsed$Global_active_power),xaxt="n" ,type="l", xlab ="", 
                 ylab= "Global Active Power (kilowatts)")

scatPlot <- scatPlot + axis(1, at= c(1,0.5*length(DayOfWeek) + 1,length(DayOfWeek)+1) ,labels = c("Thu", "Fri", "Sat"))

dev.off() # closed the device call to png

