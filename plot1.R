# This script assumes that file household_power_consumption.txt is saved on working directory
# 
# If the file is not in the working directory, uncomment the lines below
#
# library(downloader)
# download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip", mode = "wb")
# unzip("exdata-data-household_power_consumption.zip")

# Get data set
power_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset data set
data_plot <- subset(power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# plot 1
gap <- as.numeric(data_plot[,3])

png("plot1.png", width=480, height=480, units = "px")

hist(gap, col = 2, main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

