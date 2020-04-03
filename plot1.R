library(data.table)
setwd("D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1")
myDataLocation<-"D:/DataScienceClass/ExploratoryDataAnalysis/ExData_Plotting1/Data/household_power_consumption.txt"
colNames<-c("date","time", "global_active_power", "global_reactive_power", 
            "voltage", "global_intensity", "sub_metering_1", "sub_metering_2","sub_metering_3")

#read data in
myData<- fread(myDataLocation, na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880, col.names = colNames)

#create graphics device and create a histograph to it
png(filename = "plot1.png")
hist(myData$global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()