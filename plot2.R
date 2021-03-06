################################################################################
##              Exploratory Data Analysis Course- Project 1
## Author       : Ralston Fonseca 
## Date         : 24 Aug 2018
## Version      : 1.0
## Description  : This script creates Plot2.png to examine how household energy 
##                  usage varies over a 2-day period in February, 2007
################################################################################

# Load packages
library(dplyr)
library(lubridate)

# Read household_power_consumption.txt data file
hpcData_full <- read.table("household_power_consumption.txt",header = TRUE, 
                           sep = ";", na.strings = "?") # dim 2075259 9

# Convert Time column to DateTime and rename the column 
hpcData_full$Time <- strptime(paste(hpcData_full$Date, hpcData_full$Time), 
                              "%d/%m/%Y %H:%M:%S")
hpc_col_names <- colnames(hpcData_full)
hpc_col_names[2] <- "DateTime"
names(hpcData_full) <- hpc_col_names

# Convert Date column to Date
hpcData_full$Date <- as.Date(hpcData_full$Date,"%d/%m/%Y")

# Select a subset of observations for 2 days : 2007-02-01 and 2007-02-02
hpcData_subset <- subset(hpcData_full, Date >= ymd("2007/02/01") & 
                             Date <= ymd("2007/02/02")) # dim 2880 9

# remove variables not neeeded to clear memory
rm(hpc_col_names,hpcData_full)

#Set width of 480 pixels and a height of 480 pixels and open png device
png("plot2.png", width=480, height=480)

# plot a line graph - Plot 2
plot(hpcData_subset$DateTime,hpcData_subset$Global_active_power,type = "l",
     xlab = "",ylab="Global Active Power (kilowatts)")

# close device
dev.off()

############################## EOF #############################################