# Coursera-fitness-analysis
Coursera Data Science course 3 getting and retrieving data - assignment for analysis of fitness data

The runanalysis.R script operates by reading in the supplied fitness data to the working directory. The  input data files are expected to have been previously downloaded from   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip             and unzipped into the working directory. 

These are the input files :

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

The script was developed on a Windows 8 pc using R version 3.1.0, the R environment is as follows:
R version 3.1.0 (2014-04-10)
Platform: i386-w64-mingw32/i386 (32-bit)

locale:
[1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252    LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                           LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] dplyr_0.4.1   reshape_0.8.5

loaded via a namespace (and not attached):
[1] assertthat_0.1  DBI_0.3.1       lazyeval_0.1.10 magrittr_1.5    parallel_3.1.0  plyr_1.8.2      Rcpp_0.11.6     tools_3.1.0  
