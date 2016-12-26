### 1.Merges the training and the test sets to create one data set.
> dir.create("./UCI HAR Dataset")
> fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(fileUrl,destfile="./Dataset.zip")
> unzip(zipfile="./Dataset.zip",exdir="./Data")
> setwd("./Data/UCI HAR Dataset")
> FilePath <- getwd()

## Read Training and Test Set files
> Training_Set <- read.table("./train/X_train.txt", header = FALSE)
> Test_Set <- read.table("./test/X_test.txt", header = FALSE)

## Read Training and Test labels files
> Training_Labels <- read.table("./train/y_train.txt", header = FALSE)
> Test_Labels <- read.table("./test/y_test.txt", header = FALSE)

## Read Training and Test Subject files
> subject_Train <- read.table("./train/subject_train.txt", header = FALSE)
> subject_Test <- read.table("./test/subject_test.txt", header = FALSE)

## Merges the training and the test sets to create one data set
> My_DataSet <- rbind(Training_Set, Test_Set)
> My_Labels <- rbind(Training_Labels, Test_Labels)
> My_Subject <- rbind(subject_Train, subject_Test)
> names(My_Labels) <- "activityNum"
> names(My_Subject) <- "subject"
> features <- read.table("./features.txt")[,2]
> names(My_DataSet) <- features
> My_DataSet <- cbind(My_Labels, My_Subject,My_DataSet)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# Extract mean and standard deviations from the merge training and test set 
> My_MeasurementCol <- grep("mean\\(\\)|std\\(\\)", names(My_DataSet))
> My_DataMeanStd <- My_DataSet[,My_MeasurementCol]

# Adding label and Subject colonns 
> My_DataMeanStd <- cbind(My_Labels, My_Subject,My_DataMeanStd)

## 3.Uses descriptive activity names to name the activities in the data set
## Read the activity labels
> My_activity_labels <- read.table("./activity_labels.txt", header = FALSE)
> names(My_activity_labels) <- c("activityNum", "activityName")

## Merge the Data with the actibity labels
> My_DataMeanStd <- merge(My_activity_labels, My_DataMeanStd, by="activityNum", all.x=TRUE)
> My_DataMeanStd <- select(My_DataMeanStd, -activityNum)

## 4.Appropriately labels the data set with descriptive variable names
> names(My_DataMeanStd)<-gsub("^t", "time", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("^f", "frequency", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("Acc", "Accelerometer", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("Gyro", "Gyroscope", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("Mag", "Magnitude", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("BodyBody", "Body", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("std()", "SD", names(My_DataMeanStd))
> names(My_DataMeanStd)<-gsub("mean()", "MEAN", names(My_DataMeanStd))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
> My_Result <- aggregate(. ~subject + activityName, My_DataMeanStd, mean)
> My_Result <- My_Result[order(My_Result$subject, My_Result$activityName),]
> write.table(My_Result, "My_TidyData.txt", row.name=FALSE)
