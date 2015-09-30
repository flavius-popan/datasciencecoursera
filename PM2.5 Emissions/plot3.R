## Flavius Popan
## 9/25/2015

## Import the ggplot2 library
library(ggplot2)

## Read RDS objects and load them into R
NEI <- readRDS("summarySCC_PM25.rds")

## Subset only the Baltimore data
BALNEI <- subset(NEI, fips == "24510")

## Make a png
png(filename = "plot3.png")

## Create the bar graph
ggplot(
    data=BALNEI, 
    aes(x=year, y=Emissions, fill = type, order = type)) + 
    geom_bar(stat = "identity")  + 
    xlab("Years") +
    ylab("Emissions (tons)") +
    ggtitle("Baltimore City PM2.5 Emission by Type")

## Close out
dev.off()
