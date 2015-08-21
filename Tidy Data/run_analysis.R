## Flavius Popan
## 8/21/2015

## Load dependancies
library(plyr); library(dplyr)

## Creates one large dataframe from test and training data
joinSets <- function(directory) {
    ## Find all test files
    testFiles <- list.files(paste(directory, "/test", sep=""), 
                            pattern="*.txt", full.names=TRUE)
    ## Find all training files
    trainFiles <- list.files(paste(directory, "/train", sep=""), 
                             pattern="*.txt", full.names=TRUE)
    
    ## Read text files and bind similar data sets
    subjectData <- rbind(read.table(testFiles[1]), read.table(trainFiles[1]))
    xData <- rbind(read.table(testFiles[2]), read.table(trainFiles[2]))
    yData <- rbind(read.table(testFiles[3]), read.table(trainFiles[3]))
    
    ## Read reference data
    activity <- read.table(paste(directory, "/activity_labels.txt", sep=""))
    features <- read.table(paste(directory, "/features.txt", sep=""))
    
    ## Use plyr join to preserve order because merge can't
    mergedY <- join(yData, activity)
    
    ## Combine all 3 data tables into one
    fullFrame <- cbind(subjectData, mergedY, xData)
    
    ## Drop the Activity ID column
    fullFrame <- fullFrame[, -c(2)]
    
    ## Create a character vector for the column names
    colNameVector <- c("Subject", "Activity")
    colNameVector <- append(colNameVector, as.character(features[,2]))
    
    ## Rename all the columns
    colnames(fullFrame) <- colNameVector
    
    return(fullFrame)
}

## Remove all measures that don't have std or mean in the column name
limitMeasurements <- function(fullFrame) {
    ## Grep for all columns with mean
    meanCols <- grep("mean", colnames(fullFrame), value = TRUE)
    
    ## Grep for all columns with std
    stdCols <- grep("std", colnames(fullFrame), value = TRUE)
    
    ## Build a character vector of approved columns
    goodCols <- c("Subject", "Activity", c(meanCols, stdCols))
    
    ## Subset the dataframe
    focusFrame <- fullFrame[, goodCols]
    
    return(focusFrame)
}

## Arrange data by Subject then Activity and summarize each measure by mean
createTidyData <- function(df) {
    df <- arrange(df, Subject, Activity)
    df <- df %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
    
    return(df)
}

## Call this function to crank out a passing grade :)
makeTidyData <- function(directory = "UCI HAR Dataset") {
    ## Uno
    fullFrame <- joinSets(directory)
    
    ## Dos
    focusFrame <- limitMeasurements(fullFrame)
    
    ## Tres
    tidyData <- createTidyData(focusFrame)
    
    ## Write the dataframe to a file in the current working directory
    write.table(tidyData, row.names = FALSE, file = "TidyData.txt")
}