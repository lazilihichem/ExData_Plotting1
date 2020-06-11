data <- read.table("household_power_consumption.txt" , header = TRUE , sep = ";")

data$day <- as.Date(data$Date , "%d/%m/%Y")

data_sub <- subset(data , day >= as.Date("2007-02-01")  & day <= as.Date("2007-02-02"))

data_sub$datetime <- as.POSIXct(paste(data_sub$Date , data_sub$Time) ,format =  "%d/%m/%Y %H:%M:%S")
png("plot4.png" , width = 480 , height = 480)
par(mfrow = c(2,2) )

plot( data_sub$datetime  , as.numeric(data_sub$Global_active_power) , ylab = "Global Acive Power (killowatte)" , xlab= "" , type = "l")

plot( data_sub$datetime  , as.numeric(data_sub$Voltage) , ylab = "Voltage" , xlab= "" , type = "l")


plot( data_sub$datetime , data_sub$Sub_metering_1 ,  xlab = "" , ylab = "Energy Sub Metering " , type = "n")

with(data_sub , {
  lines(datetime , Sub_metering_1 , col = "black" , type = "l")
  lines(datetime , Sub_metering_2 , col = "red" , type = "l")
  lines(datetime , Sub_metering_3 , col = "blue" , type = "l")
  legend("topright" , pch = 1 , col = c("black" , "red" , "blue") , legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"))
})

plot( data_sub$datetime  , as.numeric(data_sub$Global_reactive_power) , ylab = "Global  Reactive Power" , xlab= "" , type = "l")

dev.off()