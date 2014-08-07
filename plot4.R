if (!file.exists("household_power_consumption.txt")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file.zip")
        unzip("file.zip")
}
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption <- household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]

household_power_consumption$Sub_metering_1 <- as.numeric(as.character(household_power_consumption$Sub_metering_1))
household_power_consumption$Sub_metering_2 <- as.numeric(as.character(household_power_consumption$Sub_metering_2))
household_power_consumption$Sub_metering_3 <- as.numeric(as.character(household_power_consumption$Sub_metering_3))
household_power_consumption$Date <- as.POSIXct(strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format= "%d/%m/%Y %H:%M:%S"))
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Global_reactive_power <- as.numeric(as.character(household_power_consumption$Global_reactive_power))
household_power_consumption$Voltage <- as.numeric(as.character(household_power_consumption$Voltage))

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))

plot(household_power_consumption$Global_active_power ~ household_power_consumption$Date, xlab = "", ylab = "Global Active Power", type = "n")
lines(household_power_consumption$Global_active_power ~ household_power_consumption$Date)

plot(household_power_consumption$Voltage ~ household_power_consumption$Date, xlab = "datetime", ylab = "Voltage", type = "n")
lines(household_power_consumption$Voltage ~ household_power_consumption$Date)

plot(household_power_consumption$Sub_metering_1 ~ household_power_consumption$Date, xlab = "", ylab = "Energy sub metering", type = "n")
lines(household_power_consumption$Sub_metering_1 ~ household_power_consumption$Date)
lines(household_power_consumption$Sub_metering_2 ~ household_power_consumption$Date, col = "red")
lines(household_power_consumption$Sub_metering_3 ~ household_power_consumption$Date, col = "blue")
legend("topright", names(household_power_consumption)[7:9], lty = 1, col=c("black", "red", "blue"))

plot(household_power_consumption$Global_reactive_power ~ household_power_consumption$Date, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(household_power_consumption$Global_reactive_power ~ household_power_consumption$Date)


dev.off()