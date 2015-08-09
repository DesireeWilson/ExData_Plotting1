##########################################################
# Desiree Wilson
# July 12, 2015
# Goal: To create 2 x 2 graph matrix plot
#	
##########################################################

#setting working directory:
wkdir <- c('/home/ayeka/Desktop/Courses/Coursera/DataScience/ExploratoryDataAnalysis/Projects/Project01/')
setwd(wkdir)


#reading in the file:
thedata <- read.table(file=c('household_power_consumption.txt'), header=TRUE, sep=';', na.strings="?", stringsAsFactors=FALSE)


#selecting rows where dates are between 2007-02-01 (Feb. 1, 2007) and 2007-02-02 (Feb. 2, 2007):
thedatesidx <- which( as.Date(thedata$Date,format=c('%d/%m/%Y')) %in% as.Date(c('01-02-2007','02-02-2007'), format=c('%d-%m-%Y')) )
thedata2 <- thedata[thedatesidx,]


thedata2_timesort <- thedata2[order(thedata2$Date, thedata2$Time),]
midnightidx <- which(thedata2_timesort$Time %in% c('00:00:00'))


png(filename=c('Graphs/plot4.png'), units=c('px'), width=480, height=480)
par(mfrow=c(2,2))

##first one:
plot(as.numeric(thedata2_timesort$Global_active_power, na.rm=TRUE), ylab=c('Global Active Power (kilowatts)'), xaxt='n', xlab='',type='l')
axis(1, las=1, at=c(midnightidx,nrow(thedata2_timesort)), label=c('Thu','Fri','Sat'))


##second one:
plot(as.numeric(thedata2_timesort$Voltage, na.rm=TRUE), ylab=c('Voltage'), xaxt='n', xlab='datetime',type='l')
axis(1, at=c(midnightidx,nrow(thedata2_timesort)), label=c('Thu','Fri','Sat'))


##third one:
plot(as.numeric(thedata2_timesort$Sub_metering_1, na.rm=TRUE), ylab=c('Energy Sub Metering'), xaxt='n', xlab='',type='l', col="black")
lines(as.numeric(thedata2_timesort$Sub_metering_2, na.rm=TRUE), ylab=c('Energy Sub Metering'), xaxt='n', xlab='',type='l', col="red")
lines(as.numeric(thedata2_timesort$Sub_metering_3, na.rm=TRUE), ylab=c('Energy Sub Metering'), xaxt='n', xlab='',type='l', col="blue")

axis(1, at=c(midnightidx,nrow(thedata2_timesort)), label=c('Thu','Fri','Sat'))
legend("topright", legend = c(colnames(thedata2_timesort)[7:9]), col = c('black', 'red', 'blue'), lty=1)


##fourth graph:
plot(as.numeric(thedata2_timesort$Global_reactive_power, na.rm=TRUE), ylab=c('Global Reactive Power'), xaxt='n', xlab='datetime',type='l')
axis(1, at=c(midnightidx,nrow(thedata2_timesort)), label=c('Thu','Fri','Sat'))

dev.off()


