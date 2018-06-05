data<-read.table("household_power_consumption.txt",header = TRUE,sep =";")
newdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
newdata$Global_active_power<-as.numeric(as.character(newdata$Global_active_power))
png("plot1.png", width=480, height=480)
hist(newdata$Global_active_power,breaks = seq(0,7.5,0.5),col = "red",main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()