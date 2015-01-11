# Set the correct Working Directory
setwd("Repository/Coursera")

# Load the data into R
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

# Convert the Date and Time variables to DateTime and append the data frame with a column containing that data
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Convert the Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Remove unnecessary Time column
data$Time <- NULL

# Select the rows corresponding to dates from 2007-02-01 to 2007-02-02
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

# Change the Global_active_power to the numeric type
data$Global_active_power <- as.numeric(as.character(data$Global_active_power)) 

# Create the PNG file
png("Explore_Project/plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the PNG file
dev.off()