run_analysis.R performs the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please see annotation in the code corresponding to each of the major tasks listed above.  

run_analysis.R downloads the UCI HAR Dataset data set and puts the zip file working directrory. After the UCI HAR Dataset is downloaded, run_analysis.R unzips the file into the UCI HAR Dataset folder. Controls exist to check if these UCI HAR Dataset files have already been downlaoaded. 
run_analysis.R loads the train and test data sets and appends the two datasets into one data frame. This is done with rbind.
run_analysis.R extracts  the mean and standard deviation from the features data set. This is done with grep.
After cleaning the column names, the extracted mean and standard deviation metrics to the x data frame.
After loading activities data set, run_analysis.R converts it to lower case using tolower and removes underscore with gsub. Activity and subject column names are named for y and subj data sets.
The three data sets, x, y and subj, are merged. The resulting dataset is exported as a txt file into the into the working directory. The exported files is named merged.txt.
The mean of activities and subjects are created as a separate tidy data set which is exported into the working directory as txt file; this is named tidy_average_std.txt.
