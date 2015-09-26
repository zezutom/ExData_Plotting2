source("utils.R")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# Answer: Yes, total emissions from PM2.5 sharply decreased from 1999 to 2008.

plot1 <- function() {
  total_emissions <- aggregate(Emissions ~ year, NEI, sum)
  
  png("plot1.png")
  plot(total_emissions$year, total_emissions$Emissions,
       type="l",
       xlab = "Year",
       ylab=expression(PM[2.5] ~ " (tons)"),
       main = expression("Total US Emissions from" ~ PM[2.5] ~ "by Year")
       )
  dev.off()
}

