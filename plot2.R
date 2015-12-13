library(data.table)
library(dplyr)
# Download the zip file and uncomress it.
plot2 <- function() {
  # read the full data set the location relative to the script location
  full <- fread("../household_power_consumption.txt",na.strings = "?")
  setkey(full,Date)
  # extract the required data for ploting.
  x <- full[list(Date = c("1/2/2007","2/2/2007"))]
  # create a new column with the data & time columns.
  x <- x %>% mutate(DateTime = paste(Date,Time))
  # create the png file with the required dimensions.
  png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
  #create the plot
  plot(strptime(x$DateTime,format="%d/%m/%Y %H:%M:%S"),x$Global_active_power, type = "o",pch = 21, cex=0, ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}