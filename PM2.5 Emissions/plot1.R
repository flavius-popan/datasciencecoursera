## Flavius Popan
## 9/25/2015

## Read RDS objects and load them into R
NEI <- readRDS("summarySCC_PM25.rds")


## Make a png
png(filename = "plot1.png")

## Make a plot
plotdata <- tapply(
    NEI$Emissions, 
    NEI$year, 
    FUN = sum)

## Make the barplot
barplot(plotdata,
        xlab = "Years", 
        ylab = "PM2.5 Emission (tons)",
        main = "PM2.5 Emissions in United States")

## 1999 Label
text(
    0.7, 
    7e+06, 
    round(sum(subset(NEI, year == "1999")$Emissions), 
          digits = 2)
)

## 2002 Label
text(
    1.9, 
    5e+06, 
    round(sum(subset(NEI, year == "2002")$Emissions), 
          digits = 2)
)

## 2005 Label
text(
    3.1, 
    5e+06, 
    round(sum(subset(NEI, year == "2005")$Emissions), 
          digits = 2)
)

## 2008 Label
text(
    4.3, 
    3e+06, 
    round(sum(subset(NEI, year == "2008")$Emissions), 
          digits = 2)
)

## Close out
dev.off()