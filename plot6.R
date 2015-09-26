# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

source("utils.R")
plot6 <- function() {
  # Assuming that motor vehicles are classified as OnRoad
  # see: http://www3.epa.gov/ttn/chief/net/2008inventory.html
  #
  # Los Angeles County, California: fips == "06037"
  # Baltimore City: fips == "24510"
  motor_vehicles_baltimore_la <- subset(NEI, type == "ON-ROAD" & (fips == "24510" | fips == "06037"))
  
  # Add a new column containg names of the respective city (depends on 'fips')
  motor_vehicles_baltimore_la$City <- ifelse(motor_vehicles_baltimore_la$fips == "06037", "Los Angeles", "Baltimore")
  total_emissions <- aggregate(Emissions ~ year + City, motor_vehicles_baltimore_la, sum)
  
  png("plot6.png")
  gp <- ggplot(total_emissions) + 
    geom_line(aes(year, Emissions, color = City)) +
    xlab("Year") + 
    ylab(expression(PM[2.5] ~ " (tons)")) +
    ggtitle(expression("Total Emissions from" ~ PM[2.5] ~ "by Year"))
  print(gp)
  dev.off()    
}