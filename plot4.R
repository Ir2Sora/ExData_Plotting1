plot4 <- function(file = "household_power_consumption.txt") {
    Sys.setlocale("LC_TIME", "English")
    par(mfrow = c(2,2))
    data <- read.table(file, sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
    names(data) <- names(read.csv2(file, nrow=1))
    
    data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    
    plot(data$DateTime, 
         data$Global_active_power, 
         type = "n",
         xlab = "", ylab = "Global Active Power")
    lines(data$DateTime, data$Global_active_power)
    
    plot(data$DateTime, 
         data$Voltage, 
         type = "n",
         xlab = "datetime", ylab = "Voltage")
    lines(data$DateTime, data$Voltage)
    
    plot(data$DateTime, 
         data$Sub_metering_1, 
         type = "n",
         xlab = "", ylab = "Energy sub metering")
    
    lines(data$DateTime, data$Sub_metering_1)
    lines(data$DateTime, data$Sub_metering_2, col = "red")
    lines(data$DateTime, data$Sub_metering_3, col = "blue")
    
    legend("topright", 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty = 1, bty = "n",
           col = c("black", "red", "blue"))  
    
    plot(data$DateTime, 
         data$Global_reactive_power, 
         type = "n",
         xlab = "datetime", ylab = "Global_reactive_power")
    lines(data$DateTime, data$Global_reactive_power)
    
    dev.copy(png, file = "plot4.png")
    dev.off()
}