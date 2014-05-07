plot2 <- function(file = "household_power_consumption.txt") {
    Sys.setlocale("LC_TIME", "English")
    data <- read.table(file, sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
    names(data) <- names(read.csv2(file, nrow=1))
    
    data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
    
    plot(data$DateTime, 
         data$Global_active_power, 
         type = "n",
         xlab = "", ylab = "Global Active Power (kilowatts)")
    lines(data$DateTime, data$Global_active_power)
    
    dev.copy(png, file = "plot2.png")
    dev.off()
}