# Coursera R: Exploratory Data Analysis Week 1 Assignment Plot 1
# 09/02/17

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
png('plot1.png')
with(df, hist(global_active_power, col='red', xlab='Global Active Power (kilowatts)',
              main='Global Active Power'))
dev.off()
