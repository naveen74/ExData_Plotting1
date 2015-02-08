df<- read.table("household_power_consumption.txt", header = TRUE, sep=";", as.is=TRUE, na.strings="?")
DATE1 <- as.Date("01/02/2007", "%d/%m/%Y")
DATE2 <- as.Date("02/02/2007", "%d/%m/%Y")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df2 <- df[df$Date >= DATE1 & df$Date <= DATE2, ]

df2$Dati <- paste(df2$Date, df2$Time)
df2$Dati <- strptime(df2$Dati, "%Y-%m-%d %H:%M:%S")
with(df2, plot(df2$Dati, df2$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(subset(df2, df2$Sub_metering_1==df2$Sub_metering_1, select=c(Dati, Sub_metering_1)), lines(Dati, df2$Sub_metering_1))
with(subset(df2, df2$Sub_metering_2==df2$Sub_metering_2, select=c(Dati, Sub_metering_2)), lines(Dati, df2$Sub_metering_2, col = "Red"))
with(subset(df2, df2$Sub_metering_3==df2$Sub_metering_3, select=c(Dati, Sub_metering_3)), lines(Dati, df2$Sub_metering_3, col = "Blue"))
dev.copy(png, file = "plot3.png")
dev.off()