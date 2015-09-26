# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

source("utils.R")
library(ggplot2)
plot4 <- function() {
  
  # Fuel combustion sectors
  sectors <- c("Fuel Comb - Comm/Instutional - Coal", 
               "Fuel Comb - Electric Generation - Coal", 
               "Fuel Comb - Industrial Boilers, ICEs - \nCoal")
  
  scc_by_sectors <- subset(SCC, EI.Sector %in% sectors)

  # Control set: short names related to coal and combustion
  scc_by_names <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
  
  # Extract the relevant codes
  coal_comb_scc <- union(scc_by_sectors$SCC, scc_by_names$SCC)
  
  # Filter emissions
  coal_comb_emissions <- subset(NEI, SCC %in% coal_comb_scc)
  
  # Plot data
  total_emissions <- aggregate(Emissions ~ year + type, coal_comb_emissions, sum)
  
  png("plot4.png", width = 600)
  gp <- qplot(year, Emissions, data=total_emissions, color=type, geom="line") + 
    xlab("Year") + 
    ylab(expression(PM[2.5] ~ " (tons)")) +    
    ggtitle(expression("Annual US emission levels from coal combustion-related sources"))
  print(gp)
  dev.off()  
}