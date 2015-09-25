## Flavius Popan
## 9/25/2015

## Read RDS objects and load them into R
NEI <- readRDS("summarySCC_PM25.rds")

## Subset only the Baltimore data
BALNEI <- subset(NEI, fips == "24510")

## Make a png
png(filename = "plot2.png")

## Make a plot
plotdata <- tapply(
    BALNEI$Emissions, 
    BALNEI$year, 
    FUN = sum)

## Make the barplot
barplot(plotdata,
        xlab = "Years", 
        ylab = "PM2.5 Emission (tons)",
        main = "PM2.5 Emissions in Baltimore City, Maryland")

## 1999 Label
text(
    0.7, 
    3000, 
    round(sum(subset(BALNEI, year == "1999")$Emissions), 
          digits = 2)
)

## 2002 Label
text(
    1.9, 
    2100, 
    round(sum(subset(BALNEI, year == "2002")$Emissions), 
          digits = 2)
)

## 2005 Label
text(
    3.1, 
    2800, 
    round(sum(subset(BALNEI, year == "2005")$Emissions), 
          digits = 2)
)

## 2008 Label
text(
    4.3, 
    1600, 
    round(sum(subset(BALNEI, year == "2008")$Emissions), 
          digits = 2)
)

## Close out
dev.off()