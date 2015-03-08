filename <- "plot1.png"

data <- read.csv2(
    "exdata_data_household_power_consumption/household_power_consumption.txt",
    na.strings = "?")
data$Date <- strptime(data$Date, "%d/%m/%Y")
goodDates <- c(as.POSIXlt("2007-02-01", format = "%Y-%m-%d"),
               as.POSIXlt("2007-02-02", format = "%Y-%m-%d"))
data <- data[data$Date %in% goodDates,]
data$Time <- strptime(data$Time, "%H:%M:%S")
png(filename)

data$Global_active_power = as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")