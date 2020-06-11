data <- read.table("household_power_consumption.txt" , header = TRUE , sep = ";")

data$day <- as.Date(data$Date , "%d/%m/%Y")

data_sub <- subset(data , day >= as.Date("2007-02-01")  & day <= as.Date("2007-02-02"))

data_sub$datetime <- as.POSIXct(paste(data_sub$Date , data_sub$Time) ,format =  "%d/%m/%Y %H:%M:%S")


png("plot2.png" , width = 480 , height = 480)

plot( data_sub$datetime  , as.numeric(data_sub$Global_active_power) , ylab = "Global Acive Power (killowatte)" , xlab= "" , type = "l")


dev.off()
