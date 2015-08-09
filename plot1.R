##########################################################
# Desiree Wilson
# August 9, 2015
# Goal: To create a histogram plot
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


#creating the first plot, histogram:
png(filename=c('Graphs/plot1.png'), units=c('px'), width=480, height=480)
hist(as.numeric(thedata2$Global_active_power, na.rm=TRUE), xlab=c('Global Active Power (kilowatts)'), col=c('red'), main=c('Global Active Power'))
dev.off()

