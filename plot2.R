## Load data and format data+time.
data <- read.delim("./data/household_power_consumption.txt",
                   header = TRUE, sep=";")
formated_dates <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1] <- formated_dates
interval = as.Date(c("01/02/2007","02/02/2007"), format = "%d/%m/%Y")
data <- data[(interval[1] == data$Date | data$Date == interval[2]),]
data$DateTime <-as.POSIXct(paste(data$Date, data$Time))  

## Open png device
png("plot2.png")

## Construct the plot
plot(data$DateTime, data$Global_active_power,
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     main = NULL)

dev.off()