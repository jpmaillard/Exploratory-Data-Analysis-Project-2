# Name: Plot2.R
# Objectif: Plot Q2 of EDA Project 2
# 
# First we load the tidyverse package into R
library(tidyverse)

# Assuming we are in the same wd of the files
# we load the 2 files into R
NEI <- read_rds("summarySCC_PM25.rds")
SCC <- read_rds("Source_Classification_Code.rds")

# We extract the Balitomre City data (fips=="24510")
BaltData <- filter(NEI, fips=="24510")

# We aggregate the data per year
ygroup <- group_by(BaltData, BaltData$year)
# We create the sum per year
data <- summarise(ygroup, Total = sum(Emissions))

# We open the device
png("plot2.png")
# We create the plot showing the yearly total emissions
barplot(data$Total, names.arg = data$`BaltData$year`, xlab = "Years", ylab = "Total Emissions", main = "Balitmore City Yearly Total PM2.5 Emissions")  
# we close the device
dev.off()
