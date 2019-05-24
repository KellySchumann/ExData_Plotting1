raw <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
raw$Date <- as.Date(raw$Date, format="%d/%m/%Y")
ds <- subset(raw, Date == '2007-02-01' | Date == '2007-02-02')
ds$Time <- strptime(paste(ds$Date, ds$Time), "%F %T")
rm(raw)

# Create Plot1
png("plot1.png", width=480, height=480)
hist(as.numeric(ds$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()