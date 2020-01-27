
#Get raw data (I assume household_power_consumption.txt it is already in your working directory)
hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Get the subset of data we are interested in 

hpcfeb <- subset(hpc, hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

# convert date and time to proper formats
hpcfeb$Date <- as.Date(hpcfeb$Date, format = "%d/%m/%Y")
hpcfeb$timetemp <- paste(hpcfeb$Date, hpcfeb$Time)
hpcfeb$timetemp <- strptime(hpcfeb$timetemp, format = "%Y-%m-%d %H:%M:%S")

#Plot the linegraph with the same labels and tittles as the reference image.

plot(x = hpcfeb$timetemp, y = hpcfeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Save the plot in the working directory
dev.copy(png, file="plot2.png", height=480, width=480)

#We close the plot 
dev.off()

