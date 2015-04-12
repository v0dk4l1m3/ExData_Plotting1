plot2 <- function() {
## first download the data and extract the txt file into the working folder (in this case ~/R)
## the next lines of codes are intended to read and extract the relevant data into a simpler table
  setwd("~/R")
  original <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
  original$Date <- as.Date(original$Date, "%d/%m/%Y")
  extract <- subset(original, Date > "2007-01-31")
  extract <- subset(extract, Date < "2007-02-03")
  write.table(extract, file = "household.txt", sep = ";", col.names = TRUE, row.names = FALSE)
  
  table <- read.delim("household.txt", sep = ";", header = TRUE)

## the next lines of codes are intended to create the second plot    
  table$DateTime <- as.POSIXct(paste(table$Date, as.character(table$Time)))
  plot(table$DateTime, table$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
}
