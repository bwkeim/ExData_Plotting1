## Load the data set
my.data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

## Subset the data set to isolate February 1 and 2nd 2007 as required by the question
subData <- subset(my.data, my.data$Date == "1/2/2007" | my.data$Date == "2/2/2007")

## Classify the variables to be plotted as their respective classes 
subData$Date <- as.Date(subData$Date, format = "%d/%m/%Y")
subData$DateTime <- strptime(paste(subData$Date, subData$Time), "%Y-%m-%d %H:%M:%S")
subData$Global_active_power <- as.numeric(subData$Global_active_power)

## Plot the variables
with(subData, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"))

## Write the plot to a png file
dev.copy(png, file = "plot2.png")
dev.off()
