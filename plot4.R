
#getting data from the text file saved on the disk
data<-read.table("household_power_consumption.txt",header = TRUE,sep =";")
#getting the required data from the bigger data file
newdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
#Getting a column of Date and Time
datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Global Active Power from the array to numeric column vector
global_active_power<-as.numeric(as.character(newdata$Global_active_power))
#Converting the Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric column vectors
Sub_metering_1<-as.numeric(as.character(newdata$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(newdata$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(newdata$Sub_metering_3))
#Converting the Voltage to a numeric column vector
Voltage<-as.numeric(as.character(newdata$Voltage))
#Converting Global_reactive_power to a numeric column vector
Global_reactive_power<-as.numeric(as.character(newdata$Global_reactive_power))
#Plotting to a png file
png("plot4.png", width=480, height=480)
#Setting the grid
par(mfrow = c(2, 2))  # 2 rows and 2 columns
#Plot:1
plot(datetime, global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)",cex=0.3)
#Plot:2
plot(datetime,Voltage,type='l',xlab = "datetime",ylab = "Voltage",cex=0.3)
#Plot:3
plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",cex=0.3)
lines(datetime,Sub_metering_2, type="l",col="red")
lines(datetime,Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, 
       col=c("black", "red", "blue"),bty = "n")
#Plot:4
plot(datetime,Global_reactive_power,type='l',xlab = "datetime",ylab = "Global_reactive_power",cex=0.3)
dev.off()