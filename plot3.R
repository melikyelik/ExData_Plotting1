if(!exists("lesson4quiz1"))
{dir.create("lesson4quiz1")}

mydata <- read.csv("household_power_consumption.txt", sep = ';', header = TRUE,stringsAsFactors=FALSE,na.strings = "?")

mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
subset <- mydata[mydata$Date %in% as.Date(as.character(c("2007-02-01","2007-02-02"))),]
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

Sys.setenv(LANG = 'en')

Sys.setlocale("LC_TIME", "English")


png("plot3.png",width=480, height=480)
plot(subset$datetime,subset$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering", col="black")
lines(subset$datetime,subset$Sub_metering_2,type="l",  col="red")
lines(subset$datetime,subset$Sub_metering_3,type="l",  col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()