library(data.table)
library(dplyr)
# Download the zip file and uncomress it.
plot3 <- function() {
  full <- fread("../household_power_consumption.txt",na.strings = "?")
  setkey(full,Date)
  # extract the required data for ploting.
  x <- full[list(Date = c("1/2/2007","2/2/2007"))]
  # create a new column with the data & time columns.
  x <- x %>% mutate(DateTime = paste(Date,Time))
  # create the png file with the required dimensions.
  png(file = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
  #create the plot
  plot(strptime(x$DateTime,format="%d/%m/%Y %H:%M:%S"),x$Sub_metering_1, type = "o",pch = 21, cex=0, ylab = "Energy sub metering", xlab = "")
  lines(strptime(x$DateTime,format="%d/%m/%Y %H:%M:%S"),x$Sub_metering_2, type ="o", col = "red", pch = 21, cex = 0)
  lines(strptime(x$DateTime,format="%d/%m/%Y %H:%M:%S"),x$Sub_metering_3, type ="o", col = "blue", pch = 21, cex = 0)
  legend("topright", legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col = c("black","red","blue"),lty = c(1,1,1), lwd = 1, cex = 0.75)
  dev.off()
}