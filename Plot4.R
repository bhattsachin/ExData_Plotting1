##initial data loading part
#read given file
x <- read.table("feb_household.txt", header = FALSE, sep = ";")
#convert first column to R date object
x[,1]<-as.Date(x[,1], "%d/%m/%Y")
#read time as R time object along with date
d <- paste(x[,1], x[,2])
d <-strptime(d, "%Y-%m-%d %H:%M:%S")

#adding empty column
x[,"datetime"]<- NA

#one shot to skip line 6,7
x$datetime <- strptime(paste(x[,1],x[,2]), "%Y-%m-%d %H:%M:%S")
#initial data loading part ends



par(mfrow=c(2,2), mar = c(4,4,1,1), oma = c(1,2,1,1))

#base plot

#plot 1
plot(x[,10], x[,3], ylab="Global Active Power", type="n", xlab="")
lines(x[,10], x[,3])

#plot 2
plot(x[,10], x[,5], ylab="Voltage", xlab="datetime", type="n")
lines(x[,10], x[,5])

#plot 3
plot(x[,10], x[,7], ylab="Energy sub metering", type="n", xlab="")
lines(x[,10], x[,7])
lines(x[,10], x[,8], col = "red")
lines(x[,10], x[,9], col = "blue")
#draw legend
legend("topright",lty=1,col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

#plot 4
plot(x[,10], x[,4], ylab="Global_reactive_power", xlab="datetime", type="n")
#draw lines
lines(x[,10], x[,4])

dev.copy(png,'plot4.png', width=480, height=480, res=60)
dev.off()

 

  
  
