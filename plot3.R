Data<-read.csv2(file.choose())
subSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]


#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering",col="black")
points(datetime, submetering2, col="red",type = "l")
points(datetime, submetering3, col="blue",type="l")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), col=c("black", "red", "blue"),lty=c(1,1,1))

dev.off()
