## Load data and format data+time.
data <- read.delim("./data/household_power_consumption.txt",
                   header = TRUE, sep=";")
formated_dates <- as.Date(data$Date, format = "%d/%m/%Y")
data[,1] <- formated_dates
interval = as.Date(c("01/02/2007","02/02/2007"), format = "%d/%m/%Y")
data <- data[(interval[1] == data$Date | data$Date == interval[2]),]
data$DateTime <-as.POSIXct(paste(data$Date, data$Time)) 

## Open png device
png("plot1.png")

## Construct the histogram
hist(as.numeric(data$Global_active_power),
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = c(0,1200),
)

dev.off()
