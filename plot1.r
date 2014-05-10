rm(list=ls())

## choice of working directory
setwd("D:/explo")

## reading data
dataset<-read.csv("household_power_consumption.txt", sep=";", head=TRUE, dec=".", na.strings = "?")

########################################
### step 1: preparing the dataset    ###
########################################


##subsetting the dataset  for days 2007-02-01 and 2007-02-02
dataset$Date2<-as.Date(as.character(dataset$Date), "%d/%m/%Y")
dataset2<-subset(dataset, dataset$Date2>="2007-02-01")
dataset3<-subset(dataset2, dataset2$Date2<="2007-02-02")



## creation of a synthetic time variable
dataset3$x<-paste(dataset3$Date,dataset3$Time)
dataset3$date_time<-strptime(dataset3$x, "%d/%m/%Y %H:%M:%S")

## dataset3 will be the working dataset
str(dataset3)


#########################
### step 2: plot 1    ###
#########################

png(file = "plot1.png") ## Open PNG device; create plot.png in my working directory
## Create plot and send to a file (no plot appears on screen)
hist(dataset3$Global_active_power, col="Red", main="Global active power", xlab="Global Active Power (kilowatts)")

dev.off() ## Close the file device

