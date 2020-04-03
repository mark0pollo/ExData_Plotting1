library(data.table)
library(dplyr) 
library(lubridate)
setwd("D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1")
myDataLocation<-"D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1/Data/household_power_consumption.txt"
colNames<-c("date","time", "global_active_power", "global_reactive_power", 
            "voltage", "global_intensity", "sub_metering_1", "sub_metering_2","sub_metering_3")

#read data in and create composite column of date time
myData<- fread(myDataLocation, na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880, col.names = colNames)
myData<-mutate(myData, DateTime = dmy_hms(paste(myData$date, myData$time, sep=" ")))

#Open png graphics device and create an empty plot which is then filled in with lines of energy sub metering vs date time
png(filename = "plot3.png")
plot(myData$DateTime, myData$sub_metering_1, type = "n",
     xlab = "", ylab = "Energy Sub Metering")

lines(myData$DateTime, myData$sub_metering_1, type = "l", col = "black")
lines(myData$DateTime, myData$sub_metering_2, type = "l", col = "red")
lines(myData$DateTime, myData$sub_metering_3, type = "l", col = "blue")

legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "sub_metering_2", "sub_metering_3"),
       lty = c(1, 1, 1), lwd = c(1, 1, 1))
dev.off()
