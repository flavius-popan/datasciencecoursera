## Flavius Popan
## 9/27/2015

library(ggplot2)

## Read in serialized data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset the SCC data frame to only include coal sources
VEHSCC <- subset(SCC, grepl("Vehicles", EI.Sector))

## Merge data sets together
VEHNEI <- merge(NEI, VEHSCC, by = "SCC")

## Subset only the Baltimore data
BALNEI <- subset(VEHNEI, fips == "24510")

## Subset only the LA data
LANEI <- subset(VEHNEI, fips == "06037")

## Create one DS
MIXNEI <- rbind(BALNEI, LANEI)

## Make a png
png(filename = "plot6.png")

## Create the plot
ggplot(
    data=MIXNEI, 
    aes(x=year, y=Emissions, fill = fips)) + 
    geom_bar(stat = "identity")  + 
    xlab("Years") +
    ylab("Emissions (tons)") +
    ggtitle("Los Angeles VS Baltimore City PM2.5 Vehicle Emission") +
    facet_grid(.~fips)

## Close out
dev.off()