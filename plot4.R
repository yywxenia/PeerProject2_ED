## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 4: How have emissions from coal combustion-related sources changed from 1999-2008?

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset the emissions data 
coalF <- subset(SCC, grepl("Coal", EI.Sector) | grepl("Coal", Short.Name))
coalE <- subset(NEI, NEI$SCC %in% coalF$SCC)
coal <- aggregate(coalE$Emissions, list(coalE$year), FUN = sum)
names(coal) <- c("Year", "Emissions")

## -------------------------------------------------------
# Plot plot4 and Save to file
library(ggplot2)
png("plot4.png") 
       
ggplot(data=coal, aes(x=Year, y=Emissions))+
         geom_bar(stat="identity") +
         ylab("Emission of" ~  PM[2.5]) +
         xlab("Year")+
         ggtitle("Emission from coal (1990-2008)")+
         theme_classic()
       
dev.off()
       