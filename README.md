run_analysis.R performs the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
run_analysis.R

run_analysis.R downloads the UCI HAR Dataset data set and puts the zip file working directrory. After it is downloaded, run_analysis.R unzips the file into the UCI HAR Dataset folder.
run_analysis.R loads the train and test data sets and appends the two datasets into one data frame. This is done using rbind.
run_analysis.R extracts just the mean and standard deviation from the features data set. This is done using grep.
After cleaning the column names, these are applied to the x data frame.
After loading activities data set, run_analysis.R converts it to lower case using tolower and removes underscore using gsub. activity and subject column names are named for y and subj data sets, respectively.
The three data sets, x, y and subj, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt.
The mean of activities and subjects are created into a separate tidy data set which is exported into the working directory as txt file; this is named tidy_average_std.txt.
