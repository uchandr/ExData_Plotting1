
library(data.table)
library(lubridate)

#Download Zip file

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="EPC.zip")
unzip("EPC.zip")

#Read the data file.Can use read.table - using fread due to file size

powercons    <- fread("household_power_consumption.txt",na.strings="?")
selpowercons <- subset(powercons, Date == "1/2/2007"| Date == "2/2/2007")

selpowercons      <- as.data.frame(selpowercons)

#Plot1 graph
hist(selpowercons$Global_active_power,col="red",xlab = "Global Active Power(kilowatts)",
     main="Global Active Power")

#Copy Plot1 to a png file
dev.copy(png,"Plot1.png",width=480,height=480)
dev.off()
