# Coursera R: Exploratory Data Analysis Week 1 Assignment Plot 2
# 09/02/17

library(lubridate)
# setwd('~/Coursera/exploratory-data-r/ExData_Plotting1')
url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, 'temp.zip')
unzip('temp.zip')
startrow<-grep('1/2/2007', readLines('household_power_consumption.txt'))
endrow<-grep('3/2/2007', readLines('household_power_consumption.txt'))
df<-read.table('household_power_consumption.txt', sep=';',
               skip=startrow[[1]]-1, nrow=endrow[[1]]-startrow[[1]])
names(df)<-c('date', 'time', 'global_active_power', 'global_reactive_power',
             'voltage', 'global_intensity', 'sub_metering_1', 'sub_metering_2',
             'sub_metering_3')
df$datetime<-with(df, dmy(date) + hms(time))
png('plot2.png')
with(df, plot(datetime, global_active_power, type='n', ylab='Global Active Power (kilowatts)'))
with(df, lines(datetime, global_active_power))
dev.off()