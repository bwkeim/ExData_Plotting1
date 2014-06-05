## Load the data set
my.data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

## Subset the data set to isolate February 1 and 2nd 2007 as required by the question
subData <- subset(my.data, my.data$Date == "1/2/2007" | my.data$Date == "2/2/2007")

## Classify the variables to be plotted as their respective classes 
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$DateTime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")
subData$Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 <- as.numeric(subData$Sub_metering_3)
subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Voltage <- as.numeric(subData$Voltage)
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)

## Set number of graphs and set margins
par(mfrow = c(2,2), mar = c(4, 4.1, 2, 2))
## Plot globabl active power
with(subData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## Plot voltage
with(subData, plot(DateTime, Voltage, type = "l", ylab = "Voltage"))

## Plot sub metering
with(subData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering"))
with(subData, lines(DateTime, Sub_metering_2, col = "red"))
with(subData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = .75, bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot global reactive power
with(subData, plot(DateTime, Global_reactive_power, type = "l"))

## Write the plot to a png file
dev.copy(png, file = "plot4.png")
dev.off()
