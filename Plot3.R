## Read in only the data from first two days of Feb 2007
data <- read.table("C:/Users/Rachel/Documents/R Programming/powerconsumption/household_power_consumption.txt", sep = ";", skip=66637, nrows=2880)

## Rename the columns so that they make sense
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Combine date and time into a single column, datetime
data$DateTime <- paste(data$Date, data$Time)

## Convert characters into timestamp with strptime
data$DateTime <- as.POSIXct(strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S"))

## Write directly to the png
png(filename = "plot3.png", width = 480, height = 480)

## Add plots separately
plot.new()
plot(data$DateTime, data$Sub_metering_1, type="l", ylim=c(-1,38),xlab = " ", ylab = "Energy sub metering")
par(new=T)
plot(data$DateTime, data$Sub_metering_2, type="l", col="red", ylim=c(-1,38), xlab = " ", ylab = "Energy sub metering")
par(new=T)
plot(data$DateTime, data$Sub_metering_3, type="l", col="blue", ylim=c(-1,38), xlab = " ", ylab = "Energy sub metering")

## Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
par(new=F)

## close the PNG device
graphics.off()