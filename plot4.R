setwd("D:/Users/kjannu/Desktop/data")
data_comp<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",comment.char="",quote='\"',stringsAsFactors=F,nrows=2075259,check.names=F)


data_comp$Date<-as.Date(data_comp$Date,format="%d/%m/%Y")## error in reading as %d%m%Y
dataone<-subset(data_comp,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dateTime<-paste(as.Date(dataone$Date),dataone$Time)
dataone$dateTime<-as.POSIXct(dateTime)

#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataone, {
  plot(Global_active_power~dateTime, type='l', 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type='l', 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~dateTime, type='l', 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Reactive Power (kilowatts)",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()