if (!file.exists("household_power_consumption.txt")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file.zip")
        unzip("file.zip")
}
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption <- household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Date <- as.POSIXct(strptime(paste(household_power_consumption$Date, household_power_consumption$Time, sep = " "), format= "%d/%m/%Y %H:%M:%S"))

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(household_power_consumption$Global_active_power ~ household_power_consumption$Date, xlab = "", ylab = "Global active Power (kilowatts)", type = "n")
lines(household_power_consumption$Global_active_power ~ household_power_consumption$Date)
dev.off()