df<- read.table("household_power_consumption.txt", header = TRUE, sep=";", as.is=TRUE, na.strings="?")
DATE1 <- as.Date("01/02/2007", "%d/%m/%Y")
DATE2 <- as.Date("02/02/2007", "%d/%m/%Y")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df1 <- df[df$Date >= DATE1 & df$Date <= DATE2, ]
hist(df1$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", col = "Red", main ="Global Active Power" )
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()