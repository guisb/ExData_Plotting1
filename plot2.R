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

# plot 2
gap <- as.numeric(data_plot[,3])

date_time <- strptime(paste(data_plot$Date, data_plot$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480, units = "px")


# to generate the graph with axis in English
# default LC_TIME is saved for later retrieval
default.locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English") 


# plot 2
plot(date_time, gap, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
axis.Date(1, at=seq(as.Date("1/2/2007"), as.Date("2/2/2007"), "weeks"), 
          cex.axis=1, lwd=1)

dev.off()

# default LC_TIME retrieval
Sys.setlocale("LC_TIME", default.locale) 