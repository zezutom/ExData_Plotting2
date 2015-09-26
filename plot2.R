# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

# Answer: Yes, total emissions from PM2.5 decreased from 1999 to 2008. There was
# a sharp decline between 1999 - 2002 followed by an increase between 2002 - 2004.
# Emissions dramatically decreased between 2004 - 2008 and remained deeply below
# the levels observed in 1999.

source("utils.R")
plot2 <- function() {
  emissions_baltimore <- subset(NEI, fips == "24510")
  total_emissions <- aggregate(Emissions ~ year, emissions_baltimore, sum)
  
  png("plot2.png")
  plot(total_emissions$year, total_emissions$Emissions,
       type="l",
       xlab = "Year",
       ylab=expression(PM[2.5] ~ " (tons)"),
       main = expression("Total Emissions for the Baltimore City from" ~ PM[2.5] ~ "by Year"))
  dev.off()  
}