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


par(mfrow=c(1,1), oma=c(1,1,1,1), mar = c(4,4,1,1))
hist(x$V3, main="Global Active Power",xlab="Global Active Power(kilowatts)", col="red")
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()