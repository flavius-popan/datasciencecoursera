## Flavius Popan
## 8/20/2015

library(plyr); library(dplyr)

## The function below joins all the training and test data sets into one
joinSets <- function() {
    directory <- "UCI HAR Dataset"
    ## Find all test files
    testFiles <- list.files(paste(directory, "/test", sep=""), 
                            pattern="*.txt", full.names=TRUE)
    ## FInd all training files
    trainFiles <- list.files(paste(directory, "/train", sep=""), 
                             pattern="*.txt", full.names=TRUE)
    
    subjectData <- rbind(read.table(testFiles[1]), read.table(trainFiles[1]))
    xData <- rbind(read.table(testFiles[2]), read.table(trainFiles[2]))
    yData <- rbind(read.table(testFiles[3]), read.table(trainFiles[3]))
    activity <- read.table(paste(directory, "/activity_labels.txt", sep=""))
    features <- read.table(paste(directory, "/features.txt", sep=""))
    
    ## Use plyr join to preserve order
    mergedY <- join(yData, activity)
    
    ## Combine all 3 data tables into one
    fullFrame <- cbind(subjectData, mergedY, xData)
    
    ## Drop the Activity ID column
    fullFrame <- fullFrame[, -c(2)]
    
    ## 
    colNameVector <- c("Subject", "Activity")
    colNameVector <- append(colNameVector, as.character(features[,2]))
    
    colnames(fullFrame) <- colNameVector
    
    return(fullFrame)
}

## STEP 1
fullFrame <- joinSets()

limitMeasurements <- function(fullFrame) {
    meanCols <- grep("mean()", colnames(fullFrame), value = TRUE)
    stdCols <- grep("std()", colnames(fullFrame), value = TRUE)
    goodCols <- c("Subject", "Activity", c(meanCols, stdCols))
    
    focusFrame <- fullFrame[, goodCols]
    return(focusFrame)
}

## STEP 2
focusFrame <- limitMeasurements(fullFrame)