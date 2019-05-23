raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
ds <- subset(raw, Date == '1/2/2007' | Date == '2/2/2007')
rm(raw)
ds$dtime <- strptime(paste(ds$Date,ds$Time,sep=" "), "%e/%m/%Y %H:%M:%S")

# Create Plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(ds$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()