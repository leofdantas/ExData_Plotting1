setwd("/Volumes/GoogleDrive/My Drive/Coursera/Course 4 - Exploratory Data Analysis/Week 1/ExData_Plotting1")

# Load dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "power_consumption.zip", method = "curl")
unzip("power_consumption.zip")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
power_consumption$Date_Time <- as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(power_consumption$Date_Time, power_consumption$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
