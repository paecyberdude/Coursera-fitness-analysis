# Coursera-fitness-analysis
Coursera Data Science course 3 getting and retrieving data - assignment for analysis of fitness data
The runanalysis.R script operates by reading in the supplied fitness data to the working directory. The expected input data files are
-activity_labels.txt     describing the types of activities
-features.txt            describing all measurements collected
and 2 directories test & train each containing 3 additional data files (zzzz suffix indicates test or train):
- subject_zzzz.txt      describing the unique individual performing the fitness task 
- x_zzzz.txt            describing the measurements collected
- y_zzzz.txt            describing the activities performed by the individual

The script performs the following methodology :
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
And saves this final tidy data set in the working directory as group_tidy.txt
