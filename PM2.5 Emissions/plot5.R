## Flavius Popan
## 9/27/2015

## Read in serialized data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the SCC data frame to only include coal sources
VEHSCC <- subset(SCC, grepl("Vehicles", EI.Sector))

## Merge data sets together
VEHNEI <- merge(NEI, VEHSCC, by = "SCC")

## Make a png
png(filename = "plot5.png")

## Make a plot
plotdata <- tapply(
    VEHNEI$Emissions, 
    VEHNEI$year, 
    FUN = sum)

## Make the barplot
barplot(plotdata,
        xlab = "Years", 
        ylab = "PM2.5 Emission (tons)",
        main = "PM2.5 Vehicle Emissions in United States")

## 1999 Label
text(
    0.7, 
    170000, 
    round(sum(subset(VEHNEI, year == "1999")$Emissions), 
          digits = 2)
)

## 2002 Label
text(
    1.9, 
    140000, 
    round(sum(subset(VEHNEI, year == "2002")$Emissions), 
          digits = 2)
)

## 2005 Label
text(
    3.1, 
    120000, 
    round(sum(subset(VEHNEI, year == "2005")$Emissions), 
          digits = 2)
)

## 2008 Label
text(
    4.3, 
    100000, 
    round(sum(subset(VEHNEI, year == "2008")$Emissions), 
          digits = 2)
)

## Close out
dev.off()