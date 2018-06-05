
#getting data from the text file saved on the disk
data<-read.table("household_power_consumption.txt",header = TRUE,sep =";")

#getting the required data from the bigger data file
newdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Getting a column of Date and Time
datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric column vectors
Sub_metering_1<-as.numeric(as.character(newdata$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(newdata$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(newdata$Sub_metering_3))

#Plotting to a png file
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,Sub_metering_2, type="l",col="red")
lines(datetime,Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, 
       col=c("black", "red", "blue"))
dev.off()