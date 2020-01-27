
#Get raw data (I assume household_power_consumption.txt it is already in your working directory)
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Get the subset of data we are interested in 

hpcfeb <- subset(hpc, hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

# convert date and time to proper formats
hpcfeb$Date <- as.Date(hpcfeb$Date, format = "%d/%m/%Y")
hpcfeb$timetemp <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$timetemp <- strptime(hpcfeb$timetemp, format = "%Y-%m-%d %H:%M:%S")



#We create the png before ( if not the legend is cutted when converting to png)

png(file = "plot3.png", width = 480, height = 480)

#Plot the linegraph with the same labels,tittles and colours as the reference image.
with(hpcfeb, {
  plot(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_2, col='Red')
  lines(x = hpcfeb$timetemp, y = hpcfeb$Sub_metering_3, col='Blue')
})
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



#We close the plot 
dev.off()