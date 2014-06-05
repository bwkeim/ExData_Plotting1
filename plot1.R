## Read in the data set and set all columns to the character class
my.data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")

## Subset the data set to isolate February 1 and 2nd 2007 as required by the question
subData <- subset(my.data, my.data$Date == "1/2/2007" | my.data$Date == "2/2/2007")

## Turn the variable Global active power into a numeric class to create
## the histogram
subData$Global_active_power <- as.numeric(subData$Global_active_power)

hist(subData$Global_active_power, breaks = 11, 
     col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Write the histogram to a png file
dev.copy(png, file = "plot1.png")
dev.off()
