#assuming the file is in the current working directory
#import file and convert to data frame

plot3 <-function() 
{
powercons<-data.frame(read.table("household_power_consumption.txt",header=TRUE,sep=';',colClasses="character",na.strings="?"))
powercons_sub <- powercons[(powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007"),]
rm(list="powercons")
powercons_sub$datetime <- paste(powercons_sub$Date,powercons_sub$Time,sep=" ")
powercons_sub$datetime <- strptime(powercons_sub$datetime,"%d/%m/%Y %H:%M:%S")

with(powercons_sub,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(powercons_sub,lines(datetime,Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red"))
with(powercons_sub,lines(datetime,Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue"))
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.copy(png,filename="plot3.png")
dev.off()
}