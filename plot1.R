plot1 <- function(file = "household_power_consumption.txt") {
    data <- read.table(file, sep = ";", skip = 66637, nrows = 2880, na.strings = "?")
    names(data) <- names(read.csv2(file, nrow=1))
    
    hist(data$Global_active_power, 
         col="red", 
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    
    dev.copy(png, file = "plot1.png")
    dev.off()
}