#
#
#
#
#
#
#
#
#
#

plot4 <- function(dataset, pngFile = "plot4.png"){
    
    hpc <- read.csv(dataset,header=TRUE,sep=";")
    hpc$NewDate <- strptime(paste(hpc$Date,hpc$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
    hpc$Date <- as.Date(as.character(hpc$Date),format("%d/%m/%Y"))
    hpc <- hpc[hpc$Date >= "2007-02-01",]
    hpc <- hpc[hpc$Date <= "2007-02-02",]
    hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
    hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
    hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
    hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
    hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
    hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
    
    png(filename = pngFile, width=480, height=480)
    par(mfrow = c(2,2))
    plot(hpc$NewDate,hpc$Global_active_power,type="l",xlab="",ylab = "Global Active Power")
    plot(hpc$NewDate,hpc$Voltage,type="l",xlab="datetime",ylab= "Voltage")
    plot(hpc$NewDate,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(hpc$NewDate,hpc$Sub_metering_2,col="red")
    lines(hpc$NewDate,hpc$Sub_metering_3,col="blue")
    legend("topright", 
           lwd=1, 
           lty=1, 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(hpc$NewDate,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    
    dev.off()
    
}
