raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
ds <- subset(raw, Date == '1/2/2007' | Date == '2/2/2007')
rm(raw)
ds$dtime <- strptime(paste(ds$Date,ds$Time,sep=" "), "%e/%m/%Y %H:%M:%S")

#Create Plot3
png("plot3.png", width=480, height = 480)
plot(ds$dtime, as.numeric(ds$Sub_metering_1), type="l", lty=1, col="black", ylab="Energy sub metering", xlab="")
lines(ds$dtime, as.numeric(ds$Sub_metering_2), type="l", lty=1, col="red")
lines(ds$dtime, as.numeric(ds$Sub_metering_3), type="l", lty=1, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()