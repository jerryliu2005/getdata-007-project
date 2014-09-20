CODE BOOK 
=================

BACKGROUND

RAW DATA FOLDER STRUCTURE
The "UCI HAR Dataset" folder contains the following subfolder and files:

* README.txt - the original REAME file that describes the background of the experiment and the original data set. This file is copied to the current repo and renamed to "originalData_README.txt." 
* features_info.txt - the file describes features selected for the original data set from the accelerometer and gyroscope 3-axial raw signals. This file is copied to the current repo as a reference as the cleaned data variables uses similar nomenclature. The copied file is renamed to "originalData_features_info.txt"
* features.txt - the complete list of variables of each feature vector. This file is also copied to the current repo for reference. The copied file is renamed to "originalData_features.txt"
* activity_labels.txt - the file contains names of 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) the volunteers (subjects) perfromted while wearing the Samsung Galaxy S II smartphone. 
* train - the folder contains data from 21 randomly selected volunteers used as the training data, which contains the "X_train.txt" file that stores all 561 feature values for each observation, the "subject_train.txt" file that stores the subject id of each observation, and the "y_train.txt" file that stores the activities of each observation using numbers 1 to 6.
* test - the folder contains data from the rest 9 volunteers used as the test data, which contains the "Y_train.txt" file that stores all 561 feature values for each observation, the "subject_test.txt" file that stores the subject id of each observation, and the "y_test.txt" file that stores the activities of each observation using numbers 1 to 6.
  
TRANSFORMATION PROCESS
The "run_analysis.R" first combines "X_train.txt", "subject_train.txt", and "y_train.txt" from the train subfolder column-wise to create a training data object "train". Then the script combines "X-test.txt", "subject_test.txt", and "y_test.txt" from the test subfolder column-wise to create a test data object "test." The two data objects is then combined row-wise to make one data set called "data". A selection of "mean" and "standard deviation (std)" features only is performed using R regular expression searching for features containing "mean()" and "std()", resulting a total of 66 features selected. The previous "data" object is subset by only using the 66 selected features. The activity names are replaced by actual names (e.g. WALKING) instead of numbers to be more intuitive. The variable names are minorly modified to remove "()" and replaced "-" with "." to make them R valid names. I think the variable names are already too long in length so to make the data frame more readable I decide to keep most the original abbreviations that are described in details in the following "DATA DICTIONARY" section. Finally a new tidy data set is created using the average of each variable for each activity and each subject. 

DATA DICTIONARY
The final data is a table of 180 rows x 68 columns. The 180 rows represent observations of each subgroup of unique subject/activity combination. The 68 columns include:

Column 1 - Subject id of 30 volunteers

Column 2 - Activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Columns 3 to 68 - Average of 66 selected mean or std features in the following format: Avg.[FEATURE].[Mean|Std]{.[X|Y|Z]}

[FEATURE] - includes features from the accelerometer (denoted by Acc), gyroscope (denoted by Gyro) 3-axial raw signals. The prefix 't' denotes time domain signals and 'f' denotes frequency domain signals. The acceleration signal was separated into body (denoted by "Body") and gravity (denoted by "Gravity") acceleration signals. The Jerk (denoted by "Jery") signals derives from the body linear acceleration and angular velocity. The magnitude (denoted by "Mag") of three-dimensional signals were calculated using the Euclidean norm.

[Mean|Std] - choose from either "Mean" or "Std"

{.[X|Y|Z]} - only appears in some features. Representing the 3-axial signals in the "X", "Y", and "Z" directions.

For example, 
Avg.tBodyAcc.Mean.X denotes Average of mean time domained Body Acceleration Signal on X-xais

The complete list of variables is contained in the 'variables.txt' in this repo.
