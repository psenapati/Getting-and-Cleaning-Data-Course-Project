This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
  Download zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  Unzip dataset
  The unziped files are in folder "UCI HAR Dataset" inside "data" folder
  View the files list
  Read the data in Activity files "Y_test.txt" and "Y_train.txt"
  Read the data in Subject files "subject_train.txt" and "subject_test.txt"
  Read the data in Feature files "X_test.txt" and "X_train.txt"
  Merge the training and the test sets to create one data set
  Extract only the measurements on the mean and standard deviation for each measurement
  Use descriptive activity names to name the activities in the data set
  Appropriately label the data set with descriptive variable names
  From the above data set, creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
The end result is shown in the file tidydataset.txt.
