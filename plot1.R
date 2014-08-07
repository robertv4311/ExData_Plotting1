if (!file.exists("household_power_consumption.txt")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "file.zip")
      unzip("file.zip")
        }
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
household_power_consumption <- household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]
household_power_consumption$Global_active_power <- as.numeric(as.character(household_power_consumption$Global_active_power))

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(household_power_consumption$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()