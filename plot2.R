##########################################################
# Desiree Wilson
# August 9, 2015
# Goal: To create a line plot
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
png(filename=c('Graphs/plot2.png'), units=c('px'), width=480, height=480)
plot(as.numeric(thedata2_timesort$Global_active_power, na.rm=TRUE), ylab=c('Global Active Power (kilowatts)'), xaxt='n', xlab='',type='l')
axis(1, las=1, at=c(midnightidx,nrow(thedata2_timesort)), label=c('Thu','Fri','Sat'))
dev.off()

