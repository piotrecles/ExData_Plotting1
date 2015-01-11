make_plot2<-function(){
  # load the data
  library(sqldf)
  data<-read.csv.sql(file = "household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",drv="SQLite")
  
  # get a datetime that's a single vector
  combined_time<-paste(data$Date,data$Time,sep=" ")
  combined_time<-strptime(combined_time,format="%d/%m/%Y %H:%M:%S")
  
  # open a png file
  png(file="plot2.png",height = 480,width = 480,bg = "white")
  
  # make the plot
  plot(combined_time,data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "l")
  
  # turn it off
  dev.off()
}