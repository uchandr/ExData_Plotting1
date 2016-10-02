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

#Create 4 sections for the graph
  par(mfcol = c(2,2))
  par(mar=c(3,4,1,1))
  
#Plot4 graphs
  
  #Graph 1
  plot(selpowercons$tmstmp,selpowercons$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  #Graph 2
  plot(selpowercons$tmstmp,selpowercons$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(selpowercons$tmstmp,selpowercons$Sub_metering_2,type="l",col="red")
  lines(selpowercons$tmstmp,selpowercons$Sub_metering_3,type="l",col="blue")
  legend("topright",cex=.5,pt.cex=1,lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Graph 3
  plot(selpowercons$tmstmp,selpowercons$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  #Graph 4
  plot(selpowercons$tmstmp,selpowercons$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  #Copy Plot4 to a png file
  dev.copy(png,"Plot4.png",width=480,height=480)
  dev.off()
