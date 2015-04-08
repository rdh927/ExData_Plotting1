## Read in only the data from first two days of Feb 2007
data <- read.table("C:/Users/Rachel/Documents/R Programming/powerconsumption/household_power_consumption.txt", sep = ";", skip=66637, nrows=2880)

## Rename the columns so that they make sense
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Make a red histogram of the global active power frequency.Include title and x label.
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copy to a PNG and close the PNG device
dev.copy(png, file = "plot1.png")
dev.off()