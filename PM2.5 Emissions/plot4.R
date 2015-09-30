## Flavius Popan
## 9/27/2015

## Read in serialized data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the SCC data frame to only include coal sources
COALSCC <- subset(SCC, grepl("Coal", EI.Sector))

## Merge data sets together
COALNEI <- merge(NEI, COALSCC, by = "SCC")

## Make a png
png(filename = "plot4.png")

## Make a plot
plotdata <- tapply(
    COALNEI$Emissions, 
    COALNEI$year, 
    FUN = sum)

## Make the barplot
barplot(plotdata,
        xlab = "Years", 
        ylab = "PM2.5 Emission (tons)",
        main = "PM2.5 Emissions in United States from Coal Sources")

## 1999 Label
text(
    0.7, 
    5e+05, 
    round(sum(subset(COALNEI, year == "1999")$Emissions), 
          digits = 2)
)

## 2002 Label
text(
    1.9, 
    5e+05, 
    round(sum(subset(COALNEI, year == "2002")$Emissions), 
          digits = 2)
)

## 2005 Label
text(
    3.1, 
    5e+05, 
    round(sum(subset(COALNEI, year == "2005")$Emissions), 
          digits = 2)
)

## 2008 Label
text(
    4.3, 
    3e+05, 
    round(sum(subset(COALNEI, year == "2008")$Emissions), 
          digits = 2)
)

## Close out
dev.off()