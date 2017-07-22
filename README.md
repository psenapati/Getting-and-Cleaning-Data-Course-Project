This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

  1. Download zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
  2. Unzip dataset
  
  3. The unziped files are in folder "UCI HAR Dataset" inside "data" folder
  
  4. View the files list
  
  5. Read the data in Activity files "Y_test.txt" and "Y_train.txt"
  
  6. Read the data in Subject files "subject_train.txt" and "subject_test.txt"
  
  7. Read the data in Feature files "X_test.txt" and "X_train.txt"
  
  8. Merge the training and the test sets to create one data set
  
  9. Extract only the measurements on the mean and standard deviation for each measurement
  
  10. Use descriptive activity names to name the activities in the data set
  
  11. Appropriately label the data set with descriptive variable names
  
  12. From the above data set, creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

The end result is shown in the file "tidydataset.txt".
