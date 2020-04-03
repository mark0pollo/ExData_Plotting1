library(data.table)
library(dplyr) 
library(lubridate)
setwd("D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1")
myDataLocation<-"D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1/Data/household_power_consumption.txt"
colNames<-c("date","time", "global_active_power", "global_reactive_power", 
            "voltage", "global_intensity", "sub_metering_1", "sub_metering_2","sub_metering_3")

#read data in and create a composite column to get a date time to plot against
myData<- fread(myDataLocation, na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880, col.names = colNames)
myData<-mutate(myData, DateTime = dmy_hms(paste(myData$date, myData$time, sep=" ")))

#open graphics device and plot just the line ofactive power vs date time
png(filename = "plot2.png")
plot(myData$DateTime, myData$global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (Kilowatts)")

lines(myData$DateTime, myData$global_active_power, type = "l")
dev.off()
