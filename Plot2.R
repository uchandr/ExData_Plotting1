library(data.table)
library(lubridate)

#Download Zip file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="EPC.zip")
unzip("EPC.zip")

#Read the file. Can use read.table - using fread due to file size

powercons    <- fread("household_power_consumption.txt",na.strings="?")
selpowercons <- subset(powercons, Date == "1/2/2007"| Date == "2/2/2007")

selpowercons      <- as.data.frame(selpowercons)

# Create timestamp
selpowerconstmstmp <- paste(selpowercons$Date, selpowercons$Time)
selpowercons$tmstmp <- dmy_hms(selpowercons$tmstmp)

#Plot2 graph
plot(selpowercons$tmstmp,selpowercons$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#Copy Plot2 to a png file
dev.copy(png,"Plot2.png",width=480,height=480)
dev.off()
