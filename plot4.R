powcons <- read.table("C:/Users/zterjek/Desktop/household_power_consumption.txt", 
                      sep = ";", header = TRUE)

powercon <- subset(powcons, Date == "1/2/2007" | Date == "2/2/2007")

powercon$dt <- paste(powercon$Date, powercon$Time, sep = " ")
powercon$datetime <- strptime(powercon$dt, format = "%d/%m/%Y %H:%M")

powercon$Global_active_power <- as.numeric(powercon$Global_active_power)
powercon$Global_reactive_power <- as.numeric(powercon$Global_reactive_power)
powercon$Voltage <- as.numeric(powercon$Voltage)
powercon$Sub_metering_1 <- as.numeric(powercon$Sub_metering_1)
powercon$Sub_metering_2 <- as.numeric(powercon$Sub_metering_2)
powercon$Sub_metering_3 <- as.numeric(powercon$Sub_metering_3)

png(filename = "C:/Users/zterjek/Desktop/plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))
plot(powercon$datetime, powercon$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(powercon$datetime, powercon$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(powercon$datetime, powercon$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy Sub Metering")
lines(powercon$datetime, powercon$Sub_metering_2, col = "red")
lines(powercon$datetime, powercon$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = "solid", col = c("black", "red", "blue"), cex = 0.5)
plot(powercon$datetime, powercon$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
