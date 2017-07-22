
#Download zip file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(getwd(), "Dataset.zip")
download.file(url, f)

#Move the downloaded file to "data" folder manualy and then Unzip dataset
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# The unziped files are in folder "UCI HAR Dataset" inside "data" folder
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
#view the files
files

#Reading the data in activity files
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

#Reading the data in Subject files
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

# Reading the data in Fearures files
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#1. Merges the training and the test sets to create one data set
#Concatenate the data tables by rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
#set names to variables
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
#Merge columns to get the data frame "Data" for all data
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

#2. Extracts only the measurements on the mean and standard deviation for each measurement
#Subset Name of Features by measurements on the mean and standard deviation
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
#Subset the data frame "Data" by seleted names of Features
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
str(Data)

#3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
activityLabels

#4. Appropriately labels the data set with descriptive variable names
names(Data)
#prefix t is replaced by time
#Acc is replaced by Accelerometer
#Gyro is replaced by Gyroscope
#prefix f is replaced by frequency
#Mag is replaced by Magnitude
#BodyBody is replaced by Body
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)

#5. From the above data set, creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
install.packages("plyr")
library(plyr)
Dataset2<-aggregate(. ~subject + activity, Data, mean)
Dataset2<-Dataset2[order(Dataset2$subject,Dataset2$activity),]
write.table(Dataset2, file = "tidydataset.txt",row.name=FALSE)

install.packages("knitr")
library(knitr)
knit2html("codebook.Rmd")
