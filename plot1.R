data <- read.table("household_power_consumption.txt" , header = TRUE , sep = ";")
data$day <- as.Date(data$Date , "%d/%m/%Y")
data_sub <- subset(data , day >= as.Date("2007-02-01")  & day <= as.Date("2007-02-02"))
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

png("plot1.png" , width = 480 , height = 480)
hist(x = data_sub$Global_active_power , xlab = "Global active power (killowattes) " , col = "red")


dev.off()
