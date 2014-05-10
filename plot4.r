rm(list=ls())

## choice of working directory
setwd("D:/explo")

## reading data
dataset<-read.csv("household_power_consumption.txt", sep=";", head=TRUE, dec=".", na.strings = "?")



########################################
### step 1: preparing the dataset    ###
########################################

## subsetting the dataset  for days 2007-02-01 and 2007-02-02
dataset$Date2<-as.Date(as.character(dataset$Date), "%d/%m/%Y")
dataset2<-subset(dataset, dataset$Date2>="2007-02-01")
dataset3<-subset(dataset2, dataset2$Date2<="2007-02-02")

## creation of a synthetic time variable
dataset3$x<-paste(dataset3$Date,dataset3$Time)
dataset3$date_time<-strptime(dataset3$x, "%d/%m/%Y %H:%M:%S")

## dataset3 will be the working dataset
str(dataset3)


#########################
### step 2: plot 4    ###
#########################

   png(file = "plot4.png") ## Open PNG device; create plot.png in my working directory

   par(mfrow=c(2,2), bg="white")                 # , mar=c(4.5,4.5,1.5,0.5)
   
   #top left plot
   hist(dataset3$Global_active_power, main="", col="Red", xlab="Global Active Power (kilowatts)")

   # top right
   plot(dataset3$date_time, dataset3$Voltage, type="l",  xlab="datetime", ylab="Voltage")


   # below left
   plot(dataset3$date_time, dataset3$Sub_metering_1, type="l",  xlab="", ylab="Energy sub metering")
   lines(dataset3$date_time, dataset3$Sub_metering_2, col="Red")
   lines(dataset3$date_time, dataset3$Sub_metering_3, col="Blue")
   title(main="")
   legend("topright", bty="n", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
   # below right
   plot(dataset3$date_time, dataset3$Global_reactive_power, type="l",  xlab="datetime", ylab="Global reactive power")
   
   dev.off()
