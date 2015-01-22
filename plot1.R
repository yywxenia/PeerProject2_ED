
## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008.

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## -------------------------------------------------------

# Aggregate the emissions by year and rename the columns
AnnualE <- aggregate(NEI$Emissions, by = list(NEI$year), FUN = sum)
names(AnnualE) <- c("Year", "Emissions")
AnnualE$Year <- as.character(AnnualE$Year)
## -------------------------------------------------------
# Plot plot1 and Save to file
png("plot1.png" ) 

plot(AnnualE$Year, AnnualE$Emissions, type = "l",
     xlab = "Year", 
     ylab = (expression("Emission of" ~  PM[2.5])),
     main = expression("Emission Change (1990-2008)"))

dev.off()

