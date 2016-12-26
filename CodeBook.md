INTRODUCTION
------------

This code book describes the data used in the script run_analysis.R, and indicates all transformations and any other relevant information to create the resulting tidy data set.

The DATA Source :
-----------------

Description of the data set :

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data source :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

CONTEXT :
---------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

TRANSFORMATION DETAILS:
----------------------
Data files were read into data frames, with appropriate column headers.

Training and test data sets were merged into a single data set.

Then only variables containing measurements with mean and standard deviation were kept. 

This left 66 feature columns, plus the subjectID and activity columns.

Labels describing explicetly the activities were applied. Following rules have been applied :

-"std()" -> "SD"

-"mean()" -> "MEAN"

-"^t" -> "time"

-"^f" -> "frequency"

-"Acc" -> "Accelerometer"

-"Gyro" -> "Gyroscope"

-"Mag" -> "Magnitude"

-"BodyBody" -> "Body"

And then a  tidy data set was created containing the mean of each feature for each subject and each activity. 
The tidy data set is an output txt file.

RESULTING DATA SET:
-------------------
Feature                                               Values

subject                                               numeric: 1 to 30

activityfactor:                                       WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,LAYING

time.body.accelerometer.mean.x                        numeric

time.body.accelerometer.mean.y                        numeric

time.body.accelerometer.mean.z                        numeric

time.body.accelerometer.std.x                         numeric

time.body.accelerometer.std.y                         numeric

time.body.accelerometer.std.z                         numeric

time.gravity.accelerometer.mean.x                     numeric

time.gravity.accelerometer.mean.y                     numeric

time.gravity.accelerometer.mean.z                     numeric

time.gravity.accelerometer.std.x                      numeric

time.gravity.accelerometer.std.y                      numeric

time.gravity.accelerometer.std.z                      numeric

time.body.accelerometer.jerk.mean.x                   numeric

time.body.accelerometer.jerk.mean.y                   numeric

time.body.accelerometer.jerk.mean.z                   numeric

time.body.accelerometer.jerk.std.x                    numeric

time.body.accelerometer.jerk.std.y                    numeric

time.body.accelerometer.jerk.std.z                    numeric

time.body.gyroscope.mean.x                            numeric

time.body.gyroscope.mean.y                            numeric

time.body.gyroscope.mean.z                            numeric

time.body.gyroscope.std.x                             numeric

time.body.gyroscope.std.y                             numeric

time.body.gyroscope.std.z                             numeric

time.body.gyroscope.jerk.mean.x                       numeric

time.body.gyroscope.jerk.mean.y                       numeric

time.body.gyroscope.jerk.mean.z                       numeric

time.body.gyroscope.jerk.std.x                        numeric

time.body.gyroscope.jerk.std.y                        numeric

time.body.gyroscope.jerk.std.z                        numeric

time.body.accelerometer.magnitude.mean                numeric

time.body.accelerometer.magnitude.std                 numeric

time.gravity.accelerometer.magnitude.mean             numeric

time.gravity.accelerometer.magnitude.std              numeric

time.body.accelerometer.jerk.magnitude.mean           numeric

time.body.accelerometer.jerk.magnitude.std            numeric

time.body.gyroscope.magnitude.mean                    numeric

time.body.gyroscope.magnitude.std                     numeric

time.body.gyroscope.jerk.magnitude.mean               numeric

time.body.gyroscope.jerk.magnitude.std                numeric

frequency.body.accelerometer.mean.x                    numeric

frequency.body.accelerometer.mean.y                    numeric

frequency.body.accelerometer.mean.z                    numeric

frequency.body.accelerometer.std.x                     numeric

frequency.body.accelerometer.std.y                     numeric

frequency.body.accelerometer.std.z                     numeric

frequency.body.accelerometer.jerk.mean.x               numeric

frequency.body.accelerometer.jerk.mean.y               numeric

frequency.body.accelerometer.jerk.mean.z               numeric

frequency.body.accelerometer.jerk.std.x                numeric

frequency.body.accelerometer.jerk.std.y                numeric

frequency.body.accelerometer.jerk.std.z                numeric

frequency.body.gyroscope.mean.x                        numeric

frequency.body.gyroscope.mean.y                        numeric

frequency.body.gyroscope.mean.z                        numeric

frequency.body.gyroscope.std.x                         numeric

frequency.body.gyroscope.std.y                         numeric

frequency.body.gyroscope.std.z                         numeric

frequency.body.accelerometer.magnitude.mean            numeric

frequency.body.accelerometer.magnitude.std             numeric

frequency.body.body.accelerometer.jerk.magnitude.mean  numeric

frequency.body.body.accelerometer.jerk.magnitude.std   numeric

frequency.body.body.gyroscope.magnitude.mean           numeric

frequency.body.body.gyroscope.magnitude.std            numeric

frequency.body.body.gyroscope.jerk.magnitude.mean      numeric

frequency.body.body.gyroscope.jerk.magnitude.std       numeric
