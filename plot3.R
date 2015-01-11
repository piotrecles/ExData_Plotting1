make_plot3<-function(){
  # load the data
  library(sqldf)
  data<-read.csv.sql(file = "household_power_consumption.txt",sep=";",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",drv="SQLite")
  
  # get a datetime that's a single vector
  combined_time<-paste(data$Date,data$Time,sep=" ")
  combined_time<-strptime(combined_time,format="%d/%m/%Y %H:%M:%S")
  
  # open a png file
  png(file="plot3.png",height = 480,width = 480,bg = "white")
  
  # make the plot
  plot(combined_time,data$Sub_metering_1,col="black",xlab = "",ylab = "Energy sub metering", type="n")
  points(combined_time,data$Sub_metering_1,col="black",type="l")
  points(combined_time,data$Sub_metering_2,col="red",type="l")
  points(combined_time,data$Sub_metering_3,col="blue",type="l")
  legend("topright",lty=c(1,1,1),cex=0.75,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # turn it off
  dev.off()
}