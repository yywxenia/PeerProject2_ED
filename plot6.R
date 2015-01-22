## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 6: Which city has seen greater changes over time in motor vehicle emissions?

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))
MD.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
MD.DF <- aggregate(MD.onroad[, 'Emissions'], by = list(MD.onroad$year), sum)
colnames(MD.DF) <- c('year', 'Emissions')
MD.DF$City <- paste(rep('MD', 4))
CA.DF <- aggregate(CA.onroad[, 'Emissions'], by = list(CA.onroad$year), sum)
colnames(CA.DF) <- c('year', 'Emissions')
CA.DF$City <- paste(rep('CA', 4))

DF <- as.data.frame(rbind(MD.DF, CA.DF))

# plot6 and save
library(ggplot2)
png("plot6.png") 

ggplot(data=DF, aes(x=year, y=Emissions))+
  geom_bar(aes(fill = year),stat = "identity") + 
  ylab("Emission of" ~  PM[2.5]) +
  xlab("Year")+
  ggtitle("Emission from Vehicles at Baltimore and LA (1990-2008)")+
  facet_grid(. ~ City) + 
  theme_classic()

dev.off()