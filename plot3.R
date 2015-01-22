## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 3: Which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == "24510")
Sourse<- aggregate(Baltimore$Emissions, list(Baltimore$type, Baltimore$year), FUN = sum)
names(Sourse) <- c("Type", "Year", "Emissions")

## -------------------------------------------------------
# Plot plot3 and Save to file
library(ggplot2)

png("plot3.png") 

ggplot(data=Sourse, aes(x=Year, y=Emissions))+
  geom_bar(stat="identity") +
  ylab("Emission of" ~  PM[2.5]) +
  xlab("Year")+
ggtitle("Emission at Baltimore by Source (1990-2008)")+
  theme_classic()
 
dev.off()
