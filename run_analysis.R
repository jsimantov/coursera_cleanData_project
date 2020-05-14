#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#
#
#   File: run_analysis.R
#     - Download Data
#     - Clean and Prepare Data for Analysis
#     - Carry out required analytical task
#     - Create tidy dataset in a text file
#     12 May 2020
#------------------------------------------------------------------------------------------------------

#load library plyr (assuming it has been already installed)
library(plyr)

#------------------------------------------------------------------------------------------------------
#
#
#   Section 1 
#   Working environment Housekeeping
#
#------------------------------------------------------------------------------------------------------
#specify input, data and output file names
print ("Initial Setup...")
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
dataFileName <- 'dataset.zip'
outputFileName <- "tidy_set.txt"

#remove previous version of the unzipped data directory, if it exists, to start with a clean version
if (dir.exists("UCI HAR Dataset"))
  unlink('UCI HAR Dataset',recursive=TRUE)

#download the data file if it hasn't been previously downloaded
if (!file.exists(dataFileName))
{
  print ("Downloading project Data...")
  download.file(fileURL,dataFileName,method="curl")
} else {
  print ("Extracting Data from Existing Project Dataset...")
} 

unzip(dataFileName)

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#
#
#   Section 2
#   Read Data from Data Source Files
#
#------------------------------------------------------------------------------------------------------

xTrain <- read.table('UCI HAR Dataset/train/X_train.txt')
yTrain <- read.table('UCI HAR Dataset/train/Y_train.txt')
subjTrain <- read.table('UCI HAR Dataset/train/subject_train.txt')
xTest <- read.table('UCI HAR Dataset/test/X_test.txt')
yTest <- read.table('UCI HAR Dataset/test/Y_test.txt')
subjTest <- read.table('UCI HAR Dataset/test/subject_test.txt')
features <- read.table('UCI HAR Dataset/features.txt')
activities <- read.table('UCI HAR Dataset/activity_labels.txt')

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#
#
#   Section 3
#   Analyse Data and retrieve required values
#
#------------------------------------------------------------------------------------------------------

print ("Merging Data into Global Set...")
xAll <- rbind(xTrain,xTest)
yAll <- rbind(yTrain,yTest)
subjAll <- rbind(subjTrain,subjTest)
print ("Retrieving Required Data Columns...")
mean_and_std_features <- grep("-(mean|std)\\(\\)",features[,2])
xAll <- xAll[,mean_and_std_features]
names(xAll) <- features[mean_and_std_features,2]
yAll[,1] <- activities[yAll[,1],2]
names(yAll) <- "Activity"
names(subjAll) <- "Subject"
globalSet <- cbind(xAll,yAll,subjAll)
globalSetCols <- colnames(globalSet)

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#
#
#   Section 4
#   Final presentation fine-tuning
#
#------------------------------------------------------------------------------------------------------

print ("Cleaning up and renaming Column Headers...")
# remove brackets from column names
globalSetCols <- gsub("[\\(\\)-]", "", globalSetCols)
# correct typo in original Data
globalSetCols <- gsub("BodyBody", "Body ", globalSetCols)

globalSetCols <- gsub("^f", "FD ", globalSetCols)
globalSetCols <- gsub("^t", "TD ", globalSetCols)
globalSetCols <- gsub("Acc", " Accelerometer ", globalSetCols)
globalSetCols <- gsub("Gyro", " Gyroscope ", globalSetCols)
globalSetCols <- gsub("Mag", " Magnitude ", globalSetCols)
globalSetCols <- gsub("mean", "- Mean ", globalSetCols)
globalSetCols <- gsub("std", "- StdDeviation ", globalSetCols)
colnames(globalSet)<-globalSetCols

#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#
#
#   Section 5
#   Calculate averages and dump to output file
#
#------------------------------------------------------------------------------------------------------

print ("Calculating Averages...")
outSet <- ddply(globalSet,.(Subject,Activity),function(x) colMeans(x[,1:(ncol(globalSet)-2)])) #calculate averages excluding the first two columns
print (paste("Creating Output File",outputFileName,"..."))
write.table(outSet,outputFileName,row.name=FALSE)
print ("Completed")
