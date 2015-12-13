library(data.table)
library(dplyr)
# Download the zip file and uncomress it.
plot1 <- function() {
  # read the full data set the location relative to the script location
  full <- fread("../household_power_consumption.txt",na.strings = "?")
  setkey(full,Date)
  # extract the required data for ploting.
  x <- full %>% mutate(Date = as.Date(Date,"%d/%m/%Y")) %>% filter(Date %in% as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d"))
  # create the png file with the required dimensions.
  png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
  # draw the histogram
  hist(x$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
  dev.off()
}