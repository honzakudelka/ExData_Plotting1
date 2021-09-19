## Load data and format data+time.
data <- read.delim("./data/household_power_consumption.txt",
                   header = TRUE, sep=";")
formated_dates <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1] <- formated_dates
interval = as.Date(c("01/02/2007","02/02/2007"), format = "%d/%m/%Y")
data <- data[(interval[1] == data$Date | data$Date == interval[2]),]
data$DateTime <-as.POSIXct(paste(data$Date, data$Time))  

## Open png device
png("plot3.png")

## Construct the plot
plot(data$DateTime, as.numeric(data$Sub_metering_1),
     type="l",
     ylab = "Energy sub metering",
     xlab = "",
     main = NULL)

## Add other two lines and a legend
lines(data$DateTime, as.numeric(data$Sub_metering_2), col="red")
lines(data$DateTime, as.numeric(data$Sub_metering_3), col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd = 1)

dev.off()
