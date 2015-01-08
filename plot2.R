library(dplyr)
data <- read.table(file.choose(),header = TRUE, sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$DateTime <- as.Date(data$DateTime, format = "%Y-%m-%d %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data3 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
data3$Global_active_power <- as.numeric(as.character(data3$Global_active_power))

png(file="plot2.png",width = 480, height = 480, units = "px")
plot(data3$DateTime,data3$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

