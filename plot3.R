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

## Plot the variables
with(subData, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering"))
with(subData, lines(DateTime, Sub_metering_2, col = "red"))
with(subData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Write the plot to a png file
dev.copy(png, file = "plot3.png")
dev.off()
