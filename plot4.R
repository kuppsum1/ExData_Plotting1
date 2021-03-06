setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
subset_data1 <- data[(data$Date == "1/2/2007"),]
subset_data2 <- data[(data$Date == "2/2/2007"),]
subset_data <- rbind(subset_data1, subset_data2)
x <- paste(as.vector(subset_data$Date), as.vector(subset_data$Time))
z <- strptime(x, "%d/%m/%Y %H:%M:%S")
png(filename = "/Users/suma/Desktop/Coursera/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
with(subset_data, {
  plot(z, as.numeric(subset_data$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "", cex.lab = 0.9, cex.axis = 0.9)
  plot(z, as.numeric(subset_data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.9, cex.axis = 0.9)
  plot(z, as.numeric(subset_data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.9, cex.axis = 0.9)
  lines(z, as.numeric(subset_data$Sub_metering_2), type = "l", col = "Red")
  lines(z, as.numeric(subset_data$Sub_metering_3), type = "l", col = "Blue")
  legend("topright", box.col = "white", lty = 1, col = c("black", "red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.45)
  plot(z, as.numeric(subset_data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.9, cex.axis = 0.9)
})
dev.copy(png, file = "/Users/suma/Desktop/Coursera/ExData_Plotting1/plot4.png")
dev.off()

