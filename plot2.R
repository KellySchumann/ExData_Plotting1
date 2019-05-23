raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
ds <- subset(raw, Date == '1/2/2007' | Date == '2/2/2007')
rm(raw)
ds$dtime <- strptime(paste(ds$Date,ds$Time,sep=" "), "%e/%m/%Y %H:%M:%S")

# Create Plot2
png("plot2.png", width=480, height=480)
plot(ds$dtime, as.numeric(ds$Global_active_power), ylab="Global Active Power (kilowatts)", type="l", lty=1, xlab="")
dev.off()