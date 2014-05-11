## This function generates a plot for energy sub metering over the first 2 day 
## period February 2007.

plot3 <- function(){
        
        ## Open png device; Create Plot3.png in working directory
        png(filename = "Plot3.png", width = 480, height = 480, units = "px")
        
        par(mar = c(2, 4, 2, 2)) ## set global graphics params
        
        ## set column names and classes
        cols <- c("character", "character", "numeric", "numeric", "numeric", 
                  "numeric", "numeric", "numeric", "numeric")
        colNames <- c("Date", "Time", "Global Active Power", 
                      "Global Reactive Power", "Voltage", "Global Intensity",
                      "Sub metering-1", "Sub metering-2", "Sub metering-3")
        
        ## zipped dataset is downloaded and unzipped in the working directory
        ## Read electric power consumption data for the first 2-day period  
        ## in February, 2007. These two days have 2880 records 
        ## and the first 66636 records can be skipped
        powerConsData <- read.table("household_power_consumption.txt", 
                                    header = TRUE, col.names = colNames,
                                    colClasses = cols, nrows = 2880, sep = ";",
                                    skip = 66636, stringsAsFactors = FALSE, 
                                    na.strings = "?", quote = "")
        
        ##plot of Energy sub metering and the two day period
        with(powerConsData, plot(strptime(paste(Date, Time), 
                format="%d/%m/%Y %H:%M:%S"), Sub.metering.1, col = "black",
                xlab = "", ylab = "Energy sub metering", type = "l"))
        with(powerConsData, lines(strptime(paste(Date, Time), 
                format="%d/%m/%Y %H:%M:%S"), Sub.metering.2, col = "red"))
        with(powerConsData, lines(strptime(paste(Date, Time), 
                format="%d/%m/%Y %H:%M:%S"), Sub.metering.3, col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
        
}
