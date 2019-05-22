path <- getwd()
household_power <- data.table::fread(file.path(path, "exdata_data_household_power_consumption/household_power_consumption.txt"),  na.strings = "?")

# Selection of the database for dates: 1/2/2007 and 2/2/2007
feb_power <- subset(household_power, household_power$Date == "1/2/2007"  | household_power$Date == "2/2/2007")

# plot1
png("plot1.png", width=480, height=480)

hist(as.numeric(feb_power$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

dev.off()
