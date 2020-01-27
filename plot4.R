
#Get raw data (I assume household_power_consumption.txt it is already in your working directory)
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Get the subset of data we are interested in 

hpcfeb <- subset(hpc, hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

# convert date and time to proper formats
hpcfeb$Date <- as.Date(hpcfeb$Date, format = "%d/%m/%Y")
hpcfeb$timetemp <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$timetemp <- strptime(hpcfeb$timetemp, format = "%Y-%m-%d %H:%M:%S")


#We create the png
png(file = "plot4.png", width = 480, height = 480)

#We create the layout for the multiple graphs 
par(mfrow = c(2, 2))

#Plot the graphs with the same labels,tittles and colours as the reference image.
with(hpcfeb, {
  plot(x = hpcfeb$timetemp, y = hpcfeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(x = hpcfeb$timetemp, y = hpcfeb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_2, type = "l", col = "red")
  lines(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(x = hpcfeb$timetemp, y = hpcfeb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

#We close the plot 
dev.off()