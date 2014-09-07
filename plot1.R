# read in the data - it's in a text file with a ";" separator, in the current working directory
## Note, this file is 129,845 KB, and R reads it entirely into RAM


full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#subset out the dates requested - format in file is in dd/mm/yyyy
 
dataUsed <- subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")

#create the histogram as requested in the assignment
#color has to be set to "red"
#labels on the x-axis (xlab), and histogram title (main) were also set 

# png file created with the png() function.   No extra parameters were sent, as this function automatically defaults to
# a resolution of 480x480 (as requested in the assignment)

 png(file = "plot1.png")

hist(as.numeric(dataUsed$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

 dev.off() # closed the device call to png

###   Note   ###
#  The graph data is consistent with the data file, which can be observed by pulling a summary:

# summary(as.numeric(dataUsed$Global_active_power))
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.220   0.320   1.060   1.213   1.688   7.482  

