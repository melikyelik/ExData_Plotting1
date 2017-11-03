if(!exists("lesson4quiz1"))
{dir.create("lesson4quiz1")}

mydata <- read.csv("household_power_consumption.txt", sep = ';', header = TRUE,stringsAsFactors=FALSE,na.strings = "?")

mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
subset <- mydata[mydata$Date %in% as.Date(as.character(c("2007-02-01","2007-02-02"))),]
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

Sys.setenv(LANG = 'en')

Sys.setlocale("LC_TIME", "English")


png("plot2.png",width=480, height=480)

plot(subset$datetime,subset$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(subset$datetime,subset$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()