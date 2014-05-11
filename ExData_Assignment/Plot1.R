## This function generates a histogram plot for Global Active Power

plot1 <- function(){
        
        ## Open png device; Create Plot1.png in working directory
        png(filename = "Plot1.png", width = 480, height = 480, units = "px")
        
        par(mar = c(4, 4, 2, 2)) ## set global graphics params
        
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
        
        ##Coerce Date and Time to date and time variables
        powerConsData$Time <- strptime(powerConsData$Time, "%H:%M:%S")
        powerConsData$Date <- as.Date(powerConsData$Date, format = "%d/%m/%Y")
        
        ##plot a histogram of Global Active Power
        hist(powerConsData$Global.Active.Power, breaks = 20, freq = TRUE, 
               main = "Global Active Power", col = "red",
               xlab = "Global Active Power (kilowatts)")       
        dev.off()
     
}

