library(data.table)
library(dplyr) 
library(lubridate)
setwd("D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1")
myDataLocation<-"D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1/Data/household_power_consumption.txt"
colNames<-c("date","time", "global_active_power", "global_reactive_power", 
            "voltage", "global_intensity", "sub_metering_1", "sub_metering_2","sub_metering_3")

myData<- fread(myDataLocation, na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880, col.names = colNames)
myData<-mutate(myData, DateTime = dmy_hms(paste(myData$date, myData$time, sep=" ")))

png("plot4.png")
#set the graphics device to show two rows and two columns of devices
par(mfrow = c(2,2))

#First Plot
plot(myData$DateTime, myData$global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power")

lines(myData$DateTime, myData$global_active_power, type = "l")

#Second Plot
plot(myData$DateTime, myData$voltage, type = "n",
     xlab = "datetime", ylab = "Voltage")

lines(myData$DateTime, myData$voltage, type = "l")

#Third Plot
plot(myData$DateTime, myData$sub_metering_1, type = "n",
     xlab = "", ylab = "Energy Sub Metering")

lines(myData$DateTime, myData$sub_metering_1, type = "l", col = "black")
lines(myData$DateTime, myData$sub_metering_2, type = "l", col = "red")
lines(myData$DateTime, myData$sub_metering_3, type = "l", col = "blue")

legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "sub_metering_2", "sub_metering_3"),
       lty = c(1, 1, 1), lwd = c(1, 1, 1))

#last plot
plot(myData$DateTime, myData$global_reactive_power, type = "n",
     xlab = "", ylab = "Global_reactive_power")

lines(myData$DateTime, myData$global_reactive_power, type = "l")

dev.off()