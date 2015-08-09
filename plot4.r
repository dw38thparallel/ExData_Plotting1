#assuming the file is in the current working directory
#import file and convert to data frame

plot4 <-function() 
{
powercons<-data.frame(read.table("household_power_consumption.txt",header=TRUE,sep=';',colClasses="character",na.strings="?"))
powercons_sub <- powercons[(powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007"),]
rm(list="powercons")
powercons_sub$datetime <- paste(powercons_sub$Date,powercons_sub$Time,sep=" ")
powercons_sub$datetime <- strptime(powercons_sub$datetime,"%d/%m/%Y %H:%M:%S")


par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
with(powercons_sub,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(powercons_sub,plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage",col="black"))
with(powercons_sub,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(powercons_sub,lines(datetime,Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red"))
with(powercons_sub,lines(datetime,Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue"))
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c("black","red","blue"))
with(powercons_sub,plot(datetime,Global_reactive_power,type="h",xlab="datetime",ylab="Global_reactive_power",col="black")) - issue

dev.copy(png,filename="plot4.png")
dev.off()
}