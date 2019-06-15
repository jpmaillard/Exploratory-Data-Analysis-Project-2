# Name: Plot4.R
# Objectif: Plot Q4 of EDA Project 2
# 
# First we load the tidyverse package into R
library(tidyverse)

# Assuming we are in the same wd of the files
# we load the 2 files into R
NEI <- read_rds("summarySCC_PM25.rds")
SCC <- read_rds("Source_Classification_Code.rds")

# we filter for coal combustion. I decided to search the Short.Name variable to determine the dataset used.
coal <- filter(SCC, str_detect(Short.Name, "Coal|coal"))
# we merge with the NEI to obtain the starting data
newdata <- merge(NEI, coal, by= "SCC")

# We aggregate the data per year
ygroup <- group_by(newdata, newdata$year)
# We create the sum per year
data <- summarise(ygroup, Total = sum(Emissions))

# We open the device
png("plot4.png")
# We create the plot showing the yearly total emissions
barplot(data$Total, names.arg = data$`newdata$year`, xlab = "Years", ylab = "Total Emissions", main = "U.S. Coal Combustion PM2.5 Emissions")
# we close the device
dev.off()
