plot4 <- function() {
## first download the data and extract the txt file into the working folder (in this case ~/R)
## the next lines of codes are intended to read and extract the relevant data into a simpler table
  setwd("~/R")
  original <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE)
  original$Date <- as.Date(original$Date, "%d/%m/%Y")
  extract <- subset(original, Date > "2007-01-31")
  extract <- subset(extract, Date < "2007-02-03")
  write.table(extract, file = "household.txt", sep = ";", col.names = TRUE, row.names = FALSE)
  
  table <- read.delim("household.txt", sep = ";", header = TRUE)

## the next lines of codes are intended to create the first plot
  table$DateTime <- as.POSIXct(paste(table$Date, as.character(table$Time)))
  par(mfrow = c(2,2))
  plot(table$DateTime, table$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
  plot(table$DateTime, table$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(table$DateTime, table$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(table$DateTime, table$Sub_metering_1, col="black")
  lines(table$DateTime, table$Sub_metering_2, col="red")
  lines(table$DateTime, table$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=0.75)
  plot(table$DateTime, table$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
}
