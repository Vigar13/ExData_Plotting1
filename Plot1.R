
#Get raw data (I assume household_power_consumption.txt it is already in your working directory)

hpc <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# Get the subset of data we are interested in 

hpcfeb <- subset(hpc, hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007")

## Plot the histogram with the same labels and tittles as the reference image. Set the colour red. 

hist(hpcfeb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save the plot in the working directory

dev.copy(png, file="plot1.png", height=480, width=480)

#We close the plot 

dev.off()

