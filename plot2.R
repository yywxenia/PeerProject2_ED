
## =====================================================================================
# Remove all current data in workspace:
rm(list=ls())
# Go to the directory where the data file exits
setwd("C:/Users/elva.yan/Documents/Training/Coursera/Exploratory data analysis/Project2/exdata-data-NEI_data")

## -------------------------------------------------------
#Requirement for Plot 2: Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## -------------------------------------------------------
# Read file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the Baltimore City data
Baltimore <- subset(NEI, fips == "24510")

# Aggregate the emissions by year and rename the columns
BalE <- aggregate(Baltimore$Emissions, list(Baltimore$year), FUN = sum)
names(BalE) <- c("Year", "Emissions")
BalE$Year <- as.character(BalE$Year)

## -------------------------------------------------------
# Plot plot2 and Save to file
png("plot2.png") 

plot(BalE$Year, BalE$Emissions, type = "l", 
          xlab = "Year",
          ylab = (expression("Emission of" ~  PM[2.5])),
          main = expression("Emission Change at Baltimore (1990-2008)"))

dev.off()