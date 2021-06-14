setwd("/Volumes/GoogleDrive/My Drive/Coursera/Course 4 - Exploratory Data Analysis/Week 1/ExData_Plotting1")

# Load dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "power_consumption.zip", method = "curl")
unzip("power_consumption.zip")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$Date_Time <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 4
### Set up Grid
png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2), mar = c(4,4,2,2))
### First Plot
plot(power_consumption$Date_Time, power_consumption$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")
### Second Plot
plot(power_consumption$Date_Time, power_consumption$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "")
lines(power_consumption$Date_Time, power_consumption$Sub_metering_2,
      type = "l",
      col = "red",
      xlab = "",
      ylab = "")
lines(power_consumption$Date_Time, power_consumption$Sub_metering_3,
      type = "l",
      col = "blue",
      xlab = "",
      ylab = "")
legend("topright", 
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty= 1,
       box.lty=0)
title(ylab="Energy sub metering")

### CThird Plot
plot(power_consumption$Date_Time, power_consumption$Voltage,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Voltage",
     mgp=c(2.5,1,0))
### Forth Plot
plot(power_consumption$Date_Time, power_consumption$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     mgp=c(2.5,1,0))

dev.off()
