path <- getwd()
household_power <- data.table::fread(file.path(path, "exdata_data_household_power_consumption/household_power_consumption.txt"), na.strings = "?")

# Selection of the database for dates: 1/2/2007 and 2/2/2007
feb_power <- subset(household_power, household_power$Date == "1/2/2007"  | household_power$Date == "2/2/2007")

# Creation of the new Data_Time column and adding in it of data and time in the POSIX format
feb_power[,Data_Time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Plot 2
png("plot2.png", width=480, height=480)

plot(x = feb_power[,Data_Time], y = as.numeric(feb_power[, Global_active_power]), type="l", xlab="", ylab="Global Active Power(kilowatts)", main = "Global Active Power Vs Time")

dev.off()
