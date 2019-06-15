# Name: Plot1.R
# Objectif: Plot Q1 of EDA Project 2
# 
# First we load the tidyverse package into R
library(tidyverse)

# Assuming we are in the same wd of the files
# we load the 2 files into R
NEI <- read_rds("summarySCC_PM25.rds")
SCC <- read_rds("Source_Classification_Code.rds")

# We aggregate the data per year
NEIy <- group_by(NEI, NEI$year)
# We create the sum per year
data <- summarise(NEIy, Total = sum(Emissions))

# We open the device
png("plot1.png")
# We create the plot showing the yearly total emissions
barplot(data$Total, names.arg = data$`NEI$year`, xlab = "Years", ylab = "Total Emissions", main = "U.S. Yearly Total PM2.5 Emissions")  
# we close the device
dev.off()
