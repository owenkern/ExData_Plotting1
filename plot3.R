filename <- "plot3.png"

data <- read.csv2(
    "exdata_data_household_power_consumption/household_power_consumption.txt",
    na.strings = "?")
charDate <- as.character(data$Date)
data$Date <- strptime(data$Date, "%d/%m/%Y")
goodDates <- c(as.POSIXlt("2007-02-01", format = "%Y-%m-%d"),
               as.POSIXlt("2007-02-02", format = "%Y-%m-%d"))
good <- data$Date %in% goodDates
data <- data[good,]
charDate <- charDate[good]
data$Time <- strptime(paste(charDate, data$Time), "%d/%m/%Y %H:%M:%S")
png(filename)

data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))