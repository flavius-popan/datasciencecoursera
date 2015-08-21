## Flavius Popan
## 8/20/2015

## The function below joins all the training and test data sets into one
joinSets <- function(directory="UCI HAR Dataset") {
    ## Find all test files
    testFiles <- list.files(paste(directory, "/test", sep=""), 
                            pattern="*.txt", full.names=TRUE)
    ## FInd all training files
    trainFiles <- list.files(paste(directory, "/train", sep=""), 
                             pattern="*.txt", full.names=TRUE)
    
    ## Join specific test & training files together first
    subjectData <- rbind(read.table(testFiles[1]), read.table(trainFiles[1]))
    xData <- rbind(read.table(testFiles[2]), read.table(trainFiles[2]))
    yData <- rbind(read.table(testFiles[3]), read.table(trainFiles[3]))
    
    ## Merge features data with x data 
    colnames(xData) <- features[,2]
    
    ## Merge actvity labels with y data
    mergedY <- merge(yData, activity_labels, by.x="V1", all = TRUE)
    ## Give descriptive column names
    colnames(mergedY) <- c("ACTIVITY_ID", "ACTIVITY_DESC")
    colnames(subjectData) <- c("SUBJECT_ID")
    
    ## Combine all 3 data tables into one
    initMain <- cbind(subjectData, mergedY, xData)
    
    return initMain
}