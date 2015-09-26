# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

source("utils.R")
plot5 <- function() {
  # Assuming that motor vehicles are classified as OnRoad
  # see: http://www3.epa.gov/ttn/chief/net/2008inventory.html
  motor_vehicles_baltimore <- subset(NEI, type == "ON-ROAD" & fips == "24510")
  
  total_emissions <- aggregate(Emissions ~ year, motor_vehicles_baltimore, sum)
  
  png("plot5.png")
  plot(total_emissions$year, total_emissions$Emissions,
       type="l",
       xlab = "Year",
       ylab=expression(PM[2.5] ~ " (tons)"),
       main = expression("Motor Vehicle Emissions for the Baltimore City from" ~ PM[2.5] ~ "by Year"))
  dev.off()  
}