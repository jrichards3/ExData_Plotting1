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
