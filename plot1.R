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
