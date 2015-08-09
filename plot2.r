#assuming the file is in the current working directory
#import file and convert to data frame

plot2 <-function() 
{
powercons<-data.frame(read.table("household_power_consumption.txt",header=TRUE,sep=';',colClasses="character",na.strings="?"))
powercons_sub <- powercons[(powercons$Date == "1/2/2007" | powercons$Date == "2/2/2007"),]
rm(list="powercons")
powercons_sub$datetime <- paste(powercons_sub$Date,powercons_sub$Time,sep=" ")
powercons_sub$datetime <- strptime(powercons_sub$datetime,"%d/%m/%Y %H:%M:%S")

with(powercons_sub,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,filename="plot2.png")
dev.off()
}