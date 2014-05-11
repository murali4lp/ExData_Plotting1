## This function generates a plot for Global Active Power over the first 2 day 
## period February 2007.

plot2 <- function(){

        ## Open png device; Create Plot2.png in working directory
        png(filename = "Plot2.png", width = 480, height = 480, units = "px")
        
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
             
        ##plot of Global Active Power and the two day period
        with(powerConsData, plot(strptime(paste(Date, Time), 
                format="%d/%m/%Y %H:%M:%S"), Global.Active.Power, 
                xlab = "", ylab = "Global Active Power (kilowatts)", 
                type = "l"))
        dev.off()
        
}
