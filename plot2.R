# Load data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# Remove unecessary data
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Convert Date and Time to R classes
data$DateTime <- strptime(paste(data$Date, data$Time), format=  "%e/%m/%Y %H:%M:%S")

# Plot data to a png file
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power,
     type = "l", ylab="Global Active Power (kilowatts)", xlab=NA)
dev.off()