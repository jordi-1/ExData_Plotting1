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
### step 2: plot 3    ###
#########################

png(file = "plot3.png") ## Open PNG device; create plot.png in my working directory
par(bg="white")

plot(dataset3$date_time, dataset3$Sub_metering_1, type="l",  xlab="", ylab="Energy sub metering")
lines(dataset3$date_time, dataset3$Sub_metering_2, col="Red")
lines(dataset3$date_time, dataset3$Sub_metering_3, col="Blue")
title(main="")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## nb: days are abbreviated in French due to my using a french version of R

dev.off()

