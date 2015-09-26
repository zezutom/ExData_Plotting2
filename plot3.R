# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Answer: Emissions of nonpoint, onroad, nonroad types decreased from 1999-2008. Emissions of the point type have increased.

source("utils.R")
library(ggplot2)
plot3 <- function() {
  emissions_baltimore <- subset(NEI, fips == "24510")
  total_emissions <- aggregate(Emissions ~ year + type, emissions_baltimore, sum)
  
  png("plot3.png")
  gp <- ggplot(total_emissions) + 
          geom_line(aes(year, Emissions, color = type)) +
          xlab("Year") + 
          ylab(expression(PM[2.5] ~ " (tons)")) +
          ggtitle(expression("Total Emissions for the Baltimore City from" ~ PM[2.5] ~ "by Year"))
  print(gp)
  dev.off()  
}