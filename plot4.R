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

# plot 4
gap <- as.numeric(data_plot[,3])
grp <- as.numeric(data_plot[,4])
voltage <- as.numeric(data_plot[,5])
sub_metering_1 <- as.numeric(data_plot[,7])
sub_metering_2 <- as.numeric(data_plot[,8])
sub_metering_3 <- as.numeric(data_plot[,9])

date_time <- strptime(paste(data_plot$Date, data_plot$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480, units = "px")

# to generate the graph with axis in English
# default LC_TIME is saved for later retrieval
default.locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English") 

# plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(date_time, gap, type = "l", ylab = "Global Active Power", xlab = "")
axis.Date(1, at=seq(as.Date("1/2/2007"), as.Date("2/2/2007"), "weeks"), 
          cex.axis=1, lwd=1)


plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
axis.Date(1, at=seq(as.Date("1/2/2007"), as.Date("2/2/2007"), "weeks"), 
          cex.axis=1, lwd=1)


plot(date_time, sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, sub_metering_2, type="l", col= 2)
lines(date_time, sub_metering_3, type="l", col= 4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty = "n")
axis.Date(1, at=seq(as.Date("1/2/2007"), as.Date("2/2/2007"), "weeks"), 
          cex.axis=1, lwd=2)


plot(date_time, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
axis.Date(1, at=seq(as.Date("1/2/2007"), as.Date("2/2/2007"), "weeks"), 
          cex.axis=1, lwd=1)


dev.off()

# default LC_TIME retrieval
Sys.setlocale("LC_TIME", default.locale) 

