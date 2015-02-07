# Load data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# Remove unecessary data
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Convert Date and Time to R classes
data$DateTime <- strptime(paste(data$Date, data$Time), format=  "%e/%m/%Y %H:%M:%S")

# Plot data to a png file
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
