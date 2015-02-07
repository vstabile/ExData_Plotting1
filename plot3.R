# Load data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
# Remove unecessary data
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Convert Date and Time to R classes
data$DateTime <- strptime(paste(data$Date, data$Time), format=  "%e/%m/%Y %H:%M:%S")

# Plot data to a png file
png(filename = "plot3.png", width = 480, height = 480)
yrange <- range(with(data, c(Sub_metering_1, Sub_metering_2, Sub_metering_3)))
plot(data$DateTime, rep(NA, length(data$DateTime)),
     type="n", ylim=yrange, xlab=NA,
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()