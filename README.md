# Getting-and-Cleaning-Data-Project-
Coursera Course Project

OBJECTIVES :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

INSTRUCTIONS:

1. Download the run_analysis.R script in your local folder.
2. Set the local folder as your working directory using setwd() function in RStudio.
3. Run the script "run_analysis.R".

INFORMATIONS:

The script will create a Data directory and download a zip file containining all the data set.

Requires the following packages :

library(dplyr)

library(data.table)

library(tidyr)

The output of the R script is a tidy data set, My_TidyData.txt.
