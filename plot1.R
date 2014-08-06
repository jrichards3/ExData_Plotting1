# Using data from UC Irvine Machine Learning Repository - Electric power consumption
#
# Plot Global Active Power for 2/1/2007 through 2/2/2007
#
# Given a dataset make a plot. Plot is defaulted to plot1.png but can be overriden.
#
# 1) Load dataset
# 2) Make NewDate which combines and formats the Date and Time into a timestamp.
# 3) Format the Date properly
# 4) Select all records 2007-02-01 and newer
# 5) Of the new set of data select all records for 2007-02-02 and older.
# 6) Format the Global Active Power as a numeric.
# 7) Open png device.
# 8) Generate histogram, format as requested.
# 9) close the device.
#
#

plot1 <- function(dataset, pngFile = "plot1.png"){
    
    hpc <- read.csv(dataset,header=TRUE,sep=";")
    hpc$NewDate <- strptime(paste(hpc$Date,hpc$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
    hpc$Date <- as.Date(as.character(hpc$Date),format("%d/%m/%Y"))
    hpc <- hpc[hpc$Date >= "2007-02-01",]
    hpc <- hpc[hpc$Date <= "2007-02-02",]
    hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
    
    png(filename = pngFile, width=480, height=480)
    hist(hpc$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")
    dev.off()
    
}
