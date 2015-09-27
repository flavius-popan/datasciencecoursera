## Flavius Popan
## 9/25/2015

## Import the ggplot2 library
library(ggplot2)

## Read RDS objects and load them into R
NEI <- readRDS("summarySCC_PM25.rds")

## Subset only the Baltimore data
BALNEI <- subset(NEI, fips == "24510")

ggplot(
    data=BALNEI, 
    aes(x=year, y=Emissions, fill = type)) + 
    geom_bar(stat = "identity")