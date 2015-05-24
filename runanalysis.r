###################################################################################
#
# Name    : runanalysis.R
#
# Purpose : Does the following:
#            1.Merges the training and the test sets to create one data set.
#            2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#            3.Uses descriptive activity names to name the activities in the data set
#            4.Appropriately labels the data set with descriptive variable names. 
#            5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Author : Pierre Evans
#
# Date   : May 2015
#
##################################################################################

# Obtain input data and store in tables - done in 2 phases
# phase 1 : obtain train data

labels <-"features.txt"
read_labels <-read.table(labels,colClasses=rep("character",1))

file1a <-"train/subject_train.txt"
file1b <-"train/x_train.txt"
file1c <-"train/y_train.txt"

read_file1a<-read.table(file1a,colClasses=rep("numeric",1))
read_file1b<-read.table(file1b,colClasses=rep("numeric",561))
read_file1c<-read.table(file1c,colClasses=rep("numeric",1))

# Store Column names for  measurements in 1st set of input data

colnames <-list()
for (i in 1:561) {
     colnames[[i]] <-read_labels$V2[[i]]
}

# ...and assign them to the measurement data frame

for (i in 1:length(colnames)) {
     names(read_file1b)[[i]]<-read_labels$V2[[i]]
}

# Assign names for Subject and activity columns
names(read_file1a)<-c("subject")
names(read_file1c)<-c("activity")
train_data<-cbind(read_file1a,read_file1c,read_file1b)

# phase 2: obtain test data

file2a <- "test/subject_test.txt"
file2b <- "test/x_test.txt"
file2c <- "test/y_test.txt"

read_file2a<-read.table(file2a,colClasses=rep("numeric",1))
read_file2b<-read.table(file2b,colClasses=rep("numeric",561))
read_file2c<-read.table(file2c,colClasses=rep("numeric",1))

# Store column names for measurements in 2nd set of input data

for (i in 1:length(colnames)) {
     names(read_file2b)[[i]]<-read_labels$V2[[i]]
}

names(read_file2a)<-c("subject")
names(read_file2c)<-c("activity")
test_data<-cbind(read_file2a,read_file2c,read_file2b)


# Join the 2 datasets

all_data<-rbind(train_data,test_data)

# Determine desired measurements - mean and std only

desired_cols<-grep("subject|activity|mean\\(\\)|std\\(\\)",x=names(all_data),ignore.case=TRUE)

# .....And assign column names to the final dataset
 
final_dataset <- data.frame()

for (i in 1:length(desired_cols)) {
     final_dataset <- c(final_dataset,all_data[desired_cols[i]])
     names(final_dataset) [[i]]<-colnames(all_data[desired_cols[i]])
}

# Determine  the Activity Descriptions to the dataset

activities <-"activity_labels.txt"
read_activities <-read.table(activities,colClasses=c("integer","character"))
names(read_activities) [[1]]<-c("activity")
names(read_activities) [[2]]<-c("activity_type")

# .....And assign them to our neat and tidy data 

merged_activities <-merge(final_dataset,read_activities,by.x="activity",by.y="activity",all=TRUE)
tidy_data<-data.frame()
tidy_data <-merged_activities[,c(2,i+1,3:i)]

# Obtain average of all desired measurements and group data by subject and activity 

grouped_tidied_data <-group_by(tidy_data,subject,activity_type) %>% summarise_each(funs(mean))


# Save final output 

write.table(grouped_tidied_data, file = "group_tidy.txt", 
sep = ",", row.names = FALSE)


# End of script
