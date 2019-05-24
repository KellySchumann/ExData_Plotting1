raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
raw$Date <- as.Date(raw$Date, format="%d/%m/%Y")
ds <- subset(raw, Date == '2007-02-01' | Date == '2007-02-02')
ds$Time <- strptime(paste(ds$Date, ds$Time), "%F %T")
rm(raw)

# Create Plot4
png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
plot(ds$dtime, as.numeric(ds$Global_active_power), type="l", lty=1, col="black", ylab="Global Active Power", xlab="")
plot(ds$dtime, as.numeric(ds$Voltage), type="l", lty=1, col="black", ylab="Global Active Power", xlab="datetime")

plot(ds$dtime, as.numeric(ds$Sub_metering_1), type="l", lty=1, col="black", ylab="Energy sub metering", xlab="")
lines(ds$dtime, as.numeric(ds$Sub_metering_2), type="l", lty=1, col="red")
lines(ds$dtime, as.numeric(ds$Sub_metering_3), type="l", lty=1, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
plot(ds$dtime, as.numeric(ds$Global_reactive_power), type="l", lty=1, col="black", ylab="Global_reactive_power", xlab="datetime")
dev.off()