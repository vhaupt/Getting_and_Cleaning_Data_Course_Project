############################################################################################
## Getting and Cleaning Data Course Project
## run_analysis.R RScript File
############################################################################################

#Clear working memory, set working directory and confirm working directory is as intended
rm(list=ls())
setwd("./")  # update to reference intended directory
getwd()

library(RCurl)

#Download and unzip Data for project
if (!file.exists("./UCI HAR Dataset")) {
  dataFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  dir.create('UCI HAR Dataset')
  download.file(dataFile, 'UCI-HAR-dataset.zip', method='curl')
  unzip('./UCI-HAR-dataset.zip')
}

## 1. Merges the training and the test sets to create one data set

#X Variables
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(x_train, x_test)

#Y Variables
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(y_train, y_test)

#Subject Variables
subj_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subj_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subj <- rbind(subj_train, subj_test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement 
features <- read.table('./UCI HAR Dataset/features.txt')
mean_sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_mean_sd <- x[, mean_sd]

# 3. Uses descriptive activity names to name the activities in the data set
names(x_mean_sd) <- features[mean_sd, 2]
names(x_mean_sd) <- tolower(names(x_mean_sd)) 
names(x_mean_sd) <- gsub("\\(|\\)", "", names(x_mean_sd))

activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
activities[, 2] <- tolower(as.character(activities[, 2]))
activities[, 2] <- gsub("_", "", activities[, 2])

y[, 1] = activities[y[, 1], 2]
colnames(y) <- 'activity'
colnames(subj) <- 'subject'

# 4. Appropriately labels the data set with descriptive variable names.
data <- cbind(subj, x_mean_sd, y)
str(data)
write.table(data, './merged.txt', row.names = F)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average.df <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.df <- average.df[, !(colnames(average.df) %in% c("subj", "activity"))]
str(average.df)
write.table(average.df, './tidy_average.txt', row.names = F)