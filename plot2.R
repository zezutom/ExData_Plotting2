# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

source("utils.R")
plot2 <- function() {
  emissions_baltimore <- subset(NEI, fips == "24510")
  total_emissions <- aggregate(Emissions ~ year, emissions_baltimore, sum)
  
  png("plot2.png")
  plot(total_emissions$year, total_emissions$Emissions,
       type="l",
       col = "red",
       xlab = "Year",
       ylab=expression(PM[2.5] ~ " (tons)"),
       main = expression("Annual emission levels from" ~ PM[2.5] ~ " in Baltimore"))
  dev.off()  
}