make_plot1<-function(){
  # load the data
  library(sqldf)
  data<-read.csv.sql(file = "household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",drv="SQLite")
  
  # open a png file
  png(file="plot1.png",height = 480,width = 480,bg = "white")
  
  # do the plot
  hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
  
  # turn it off
  dev.off()
}