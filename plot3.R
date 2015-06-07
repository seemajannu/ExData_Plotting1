setwd("D:/Users/kjannu/Desktop/data")
data_comp<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",comment.char="",quote='\"',stringsAsFactors=F,nrows=2075259,check.names=F)


data_comp$Date<-as.Date(data_comp$Date,format="%d/%m/%Y")## error in reading as %d%m%Y
dataone<-subset(data_comp,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dateTime<-paste(as.Date(dataone$Date),dataone$Time)
dataone$dateTime<-as.POSIXct(dateTime)


#plot3.R
with(dataone, {
             plot(Sub_metering_1~dateTime,type='l',ylab="Energy sub metering",xlab=" ")
             lines(Sub_metering_2~dateTime,col="Red")
             lines(Sub_metering_3~dateTime,col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=400)
dev.off()
