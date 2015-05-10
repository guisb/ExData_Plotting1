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

# plot 3
sub_metering_1 <- as.numeric(data_plot[,7])
sub_metering_2 <- as.numeric(data_plot[,8])
sub_metering_3 <- as.numeric(data_plot[,9])

date_time <- strptime(paste(data_plot$Date, data_plot$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480, units = "px")

# to generate the graph with axis in English
# default LC_TIME is saved for later retrieval
default.locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English") 

plot(date_time, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, sub_metering_2, type="l", col= 2)
lines(date_time, sub_metering_3, type="l", col= 4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.off()

# default LC_TIME retrieval
Sys.setlocale("LC_TIME", default.locale) 