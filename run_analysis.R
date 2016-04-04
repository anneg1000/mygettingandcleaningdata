##****************************************************************** 
## Assignment: Getting and Cleaning Data Course Project
##******************************************************************

## 0. Download and unzip the dataset using the url given 

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destdir <- "UCI HAR Dataset"
zipfile <- "Dataset.zip"
if(!file.exists(destdir)) { 
  if(!file.exists(zipfile)) {
    download.file(url, destfile=zipfile)
    unzip(zipfile=zipfile)
  }
}

files <- list.files(destdir, recursive=TRUE)
files

## 1. Merges the training and the test sets to create one data set
library(data.table)
trainx <- read.table("UCI HAR Dataset/train/X_train.txt")
testx  <- read.table("UCI HAR Dataset/test/X_test.txt" )
featuredata <- rbind(trainx, testx)

trainy <- read.table("UCI HAR Dataset/train/Y_train.txt")
testy  <- read.table("UCI HAR Dataset/test/Y_test.txt")
activitydata <- rbind(trainy, testy)

trains <- read.table("UCI HAR Dataset/train/subject_train.txt")
tests  <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectdata <- rbind(trains, tests)

str(featuredata)
str(activitydata)
str(subjectdata)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")
cleanfeatures <- gsub("([()])", "", features[,2])
cleanfeatures <- gsub("([-])","", cleanfeatures)
cleanfeatures <- gsub("([,])","", cleanfeatures)
colnames(featuredata) <- cleanfeatures

idx <- grep("mean\\(\\)|std\\(\\)", features$V2)
featuredata <- featuredata[, idx]
head(featuredata, 10)

## 3. Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitydata[,1] = activitylabels[activitydata[,1], 2]
names(activitydata) <- "activity"

head(activitydata, 10)
tail(activitydata, 10)

## 4. Appropriately labels the data set with descriptive variable names
names(subjectdata) <- "subject"
head(subjectdata,10)
tail(subjectdata,10)

combined <- cbind(subjectdata, activitydata, featuredata)

dim(combined)
names(combined)
names(combined) <- gsub("^t", "time", names(combined))
names(combined) <- gsub("^f", "frequency", names(combined))
names(combined) <- gsub("Acc", "Accelerometer", names(combined))
names(combined) <- gsub("Gyro", "Gyroscope", names(combined))
names(combined) <- gsub("Mag", "Magnitude", names(combined))
names(combined) <- gsub("BodyBody", "Body", names(combined))
names(combined)

write.table(combined, file="tidydata.txt", row.names=FALSE)

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
names(combined) <- tolower(names(combined))
avg <- aggregate(. ~subject + activity, combined, mean)
avg <- avg[order(avg$subject, avg$activity), ]
write.table(avg, file="tidydata_with_average.txt", row.names=FALSE)
head(avg,20)

# reshape the data using melt() to generate long-format data based on the activity and subject for all measurements
library(reshape2)
avg2 <- melt(avg, id=c("subject", "activity"))
write.table(avg2, file="tidydata_with_average_long.txt", row.names=FALSE)
head(avg,20)
