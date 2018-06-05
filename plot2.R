
#getting data from the text file saved on the disk
data<-read.table("household_power_consumption.txt",header = TRUE,sep =";")

#getting the required data from the bigger data file
newdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Getting a column of Date and Time
datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Converting the Global Active Power from the array to numeric column vector
global_active_power<-as.numeric(as.character(newdata$Global_active_power))

#Plotting to a png file
png("plot2.png", width=480, height=480)
plot(datetime, global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()