df<- read.table("household_power_consumption.txt", header = TRUE, sep=";", as.is=TRUE, na.strings="?")
DATE1 <- as.Date("01/02/2007", "%d/%m/%Y")
DATE2 <- as.Date("02/02/2007", "%d/%m/%Y")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df3 <- df[df$Date >= DATE1 & df$Date <= DATE2, ]

df3$Dati <- paste(df3$Date, df3$Time)
df3$Dati <- strptime(df3$Dati, "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
plot(df3$Dati, df3$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(df3$Dati, df3$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

with(df3, plot(df3$Dati, df3$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(subset(df3, df3$Sub_metering_1==df3$Sub_metering_1, select=c(Dati, Sub_metering_1)), lines(Dati, df3$Sub_metering_1))
with(subset(df3, df3$Sub_metering_2==df3$Sub_metering_2, select=c(Dati, Sub_metering_2)), lines(Dati, df3$Sub_metering_2, col = "Red"))
with(subset(df3, df3$Sub_metering_3==df3$Sub_metering_3, select=c(Dati, Sub_metering_3)), lines(Dati, df3$Sub_metering_3, col = "Blue"))

plot(df3$Dati, df3$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()
