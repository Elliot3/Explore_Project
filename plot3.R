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

# Convert the 2 variables into numeric type (Sub_metering_3 was already of the numeric type)
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

# Create the PNG file
png("Explore_Project/plot3.png")
plot(data$DateTime, data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the PNG file
dev.off()