setwd("~/Desktop")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
subset_data1 <- data[(data$Date == "1/2/2007"),]
subset_data2 <- data[(data$Date == "2/2/2007"),]
subset_data <- rbind(subset_data1, subset_data2)
x <- paste(as.vector(subset_data$Date), as.vector(subset_data$Time))
z <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(z, as.numeric(subset_data$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.9, cex.axis = 0.9)
dev.copy(png, file = "/Users/suma/Desktop/Coursera/ExData_Plotting1/plot2.png")
dev.off()
png(filename = "/Users/suma/Desktop/Coursera/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")