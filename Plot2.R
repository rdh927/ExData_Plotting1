## Read in only the data from first two days of Feb 2007
data <- read.table("C:/Users/Rachel/Documents/R Programming/powerconsumption/household_power_consumption.txt", sep = ";", skip=66637, nrows=2880)

## Rename the columns so that they make sense
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Combine date and time into a single column, datetime
data$DateTime <- paste(data$Date, data$Time)

## Convert characters into timestamp with strptime
data$DateTime <- as.POSIXct(strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S"))

## Plot GAP(kW) vs. time
with (data, plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)"))

## Copy to a PNG and close the PNG device
dev.copy(png, file = "plot2.png")
dev.off()