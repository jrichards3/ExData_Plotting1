# Using data from UC Irvine Machine Learning Repository - Electric power consumption
#
# Plot Energy Sub Metering for 2/1/2007 through 2/2/2007
#
# Given a dataset make a plot. Plot is defaulted to plot3.png but can be overriden.
#
# 1) Load dataset
# 2) Make NewDate which combines and formats the Date and Time into a timestamp.
# 3) Format the Date properly
# 4) Select all records 2007-02-01 and newer
# 5) Of the new set of data select all records for 2007-02-02 and older.
# 6) Format the Sub_energy_metering_1,_2 and _3 as a numeric.
# 7) Open png device.
# 8) Generate plot of Sub_energy_metering_1,Sub_energy_metering_2 and Sub_energy_metering_3. Each with there own color and a legend.
# 9) close the device.
#
#

plot3 <- function(dataset, pngFile = "plot3.png"){
    
    hpc <- read.csv(dataset,header=TRUE,sep=";")
    hpc$NewDate <- strptime(paste(hpc$Date,hpc$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
    hpc$Date <- as.Date(as.character(hpc$Date),format("%d/%m/%Y"))
    hpc <- hpc[hpc$Date >= "2007-02-01",]
    hpc <- hpc[hpc$Date <= "2007-02-02",]
    hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
    hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
    hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
    
    png(filename = pngFile, width=480, height=480)
    plot(hpc$NewDate,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(hpc$NewDate,hpc$Sub_metering_2,col="red")
    lines(hpc$NewDate,hpc$Sub_metering_3,col="blue")
    legend("topright", 
           lwd=1, 
           lty=1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    dev.off()
    
}
