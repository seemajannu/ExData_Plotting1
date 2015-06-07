setwd("D:/Users/kjannu/Desktop/data")
data_comp<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",comment.char="",quote='\"',stringsAsFactors=F,nrows=2075259,check.names=F)


data_comp$Date<-as.Date(data_comp$Date,format="%d/%m/%Y")
dataone<-subset(data_comp,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
dateTime<-paste(as.Date(dataone$Date),dataone$Time)
dataone$dateTime<-as.POSIXct(dateTime)


plot(dataone$Global_active_power~dataone$dateTime, type='l',xlab="",ylab="Global_active_power(kilowatts)")
dev.copy(png,file="plot2.png", height=480, width=400)
dev.off()

