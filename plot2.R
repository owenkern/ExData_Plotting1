filename <- "plot2.png"

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

data$Global_active_power = as.numeric(as.character(data$Global_active_power))
plot(data$Time, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
