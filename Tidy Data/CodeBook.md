## Tida Data Code Book

#### Introduction
This code book aims to help the user understand the data produced by the 
run_analysis.R script.

#### Prerequisites
In order to fully understand the scope of the dataset and the experiment that
produced it, please take the time to read the official [README](https://github.com/locrawl/datasciencecoursera/tree/master/Tidy%20Data/UCI%20HAR%20Dataset)

#### Measures & Features Explanation
The **TidyData.txt** file exported by the run_analysis.R script will contain
the following 81 columns:

* Subject - Represents the subject ID of the 30 participants. Its range is from 1 to 30. 

* Activity - LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

The remaining 79 features are **ALL AVERAGES** of the original measure names
and are normalized and bounded within [-1,1].

NOTE: Per the project instructions, the original 561 measures were filtered to
only include those measures that contain mean or standard deviation data. It was
not specified however if this meant only measures that contained mean() or simply
mean, so the run_analysis.R script finds all measure names containing the strings
"mean" and "std". This is to allow for future expansion of the dataset to include
new measures without having to rewrite the script.

##### From the [features_info.txt](https://github.com/locrawl/datasciencecoursera/blob/master/Tidy%20Data/UCI%20HAR%20Dataset/features_info.txt) in the data set
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc.mean...X
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
* tBodyAccJerk.mean...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y
* tBodyGyro.mean...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y
* tBodyGyroJerk.mean...Z
* tBodyAccMag.mean..
* tGravityAccMag.mean..
* tBodyAccJerkMag.mean..
* tBodyGyroMag.mean..
* tBodyGyroJerkMag.mean..
* fBodyAcc.mean...X
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAcc.meanFreq...X
* fBodyAcc.meanFreq...Y
* fBodyAcc.meanFreq...Z
* fBodyAccJerk.mean...X
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyAccJerk.meanFreq...X
* fBodyAccJerk.meanFreq...Y
* fBodyAccJerk.meanFreq...Z
* fBodyGyro.mean...X
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyGyro.meanFreq...X
* fBodyGyro.meanFreq...Y
* fBodyGyro.meanFreq...Z
* fBodyAccMag.mean..
* fBodyAccMag.meanFreq..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyAccJerkMag.meanFreq..
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroMag.meanFreq..
* fBodyBodyGyroJerkMag.mean..
* fBodyBodyGyroJerkMag.meanFreq..
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y
* tGravityAcc.std...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y
* tBodyAccJerk.std...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y
* tBodyGyro.std...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y
* tBodyGyroJerk.std...Z
* tBodyAccMag.std..
* tGravityAccMag.std..
* tBodyAccJerkMag.std..
* tBodyGyroMag.std..
* tBodyGyroJerkMag.std..
* fBodyAcc.std...X
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAccJerk.std...X
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyGyro.std...X
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyAccMag.std..
* fBodyBodyAccJerkMag.std..
* fBodyBodyGyroMag.std..
* fBodyBodyGyroJerkMag.std..