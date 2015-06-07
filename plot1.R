setwd("D:/Users/kjannu/Desktop/data")
data_comp<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",comment.char="",quote='\"',stringsAsFactors=F,nrows=2075259,check.names=F)
data_comp$Date<-as.Date(data_comp$Date,format="%d/%m/%Y")
dataone<-subset(data_comp,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
datetime<-paste(as.Date(dataone$Date),dataone$Time)
dataone$datetime<-as.POSIXct(datetime)



##plot1.R

hist(dataone$Global_active_power,col="red",main="Global_active_power",xlab="Global_active_power(Kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png",height=480,width=400)
dev.off()