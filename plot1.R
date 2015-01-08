library(dplyr)
data <- read.table(file.choose(),header = TRUE, sep=";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data3 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data3$Global_active_power <- as.numeric(as.character(data3$Global_active_power))

png(file="plot1.png",width = 480, height = 480, units = "px")
hist(data3$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()