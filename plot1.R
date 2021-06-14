
setwd("/Volumes/GoogleDrive/My Drive/Coursera/Course 4 - Exploratory Data Analysis/Week 1/ExData_Plotting1")

# Load dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "power_consumption.zip", method = "curl")
unzip("power_consumption.zip")

power_consumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

# Plot 1
png("plot1.png", width = 480, height = 480)
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()
