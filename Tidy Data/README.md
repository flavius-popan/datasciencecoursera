---
Author: "Flavius Popan"
Date: "August 20, 2015"
Course: "Getting & Cleaning Data"
Assignment: "Tidy Data Course Project"
---

#### Introduction
Tidy Data is a project developed to analyze and produce a single orderdly data
set based on the information collected by SmartLab. The initial data set is
included in the repository but also available from the [UCI Machine Learning
Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#### Requirements
In order to run the run_analysis.R script, the dplyr and plyr libraries must be 
installed. You can do this by running

```{r}
install.packages("dplyr"); install.packages("plyr")
```

from the console. Additionally, the smartphone data set must be in the same
directory as the run_analysis.R script. And finally, use the 

```{r}
setwd()
```

command to ensure your workspace is set to the parent folder of the project.

#### Usage
In order to create a single tidy data set, invoke the script by running

```{r}
source('run_analysis.R')
```

from the R console. If using the data provided in this repository (UCI HAR Dataset),
simply run 

```{r}
makeTidyData()
```

from the console. After a few seconds, **TidyData.txt** will be created in the
current directory. If the folder is in a different location or named differently,
pass it's current location to the makeTidyData function.