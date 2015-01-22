## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 5: How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the source data 
motorF<- subset(SCC, grepl("On-Road", EI.Sector))
motorF2 <- subset(NEI, fips == "24510" & NEI$SCC %in% motorF$SCC)
motor <- aggregate(motorF2$Emissions, list(motorF2$year), FUN = sum)
names(motor) <- c("Year", "Emissions")

## -------------------------------------------------------
# Plot5 and save
library(ggplot2)
png("plot5.png") 

ggplot(data=motor, aes(x=Year, y=Emissions))+
  geom_bar(stat="identity") +
  ylab("Emission of" ~  PM[2.5]) +
  xlab("Year")+
  ggtitle("Emission from Vehicles at Baltimore (1990-2008)")+
  theme_classic()

dev.off()
