getdata-007-project
===================

##WHAT IS ABOUT

This is a repository of the R code "run_analysis.R" and the code book that is used to create a tidy data set per requirement of the Cousera course "Getting and Cleaning Data" course project. The course URL is https://class.coursera.org/getdata-007/.

##RAW DATA 

The original data is "wearable" data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The actual data can be downloaded at:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##REQUIREMENT

The final "tidy" data should satisfy the rules set and explained in details in Hadley Wickham's artical of "Tidy Data" (http://vita.had.co.nz/papers/tidy-data.pdf) including:
1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.


The requirement is that the "run_analysis.R" script can clean and tidy up the raw data and performe the following tasks (these are copied from the course project requirements):
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
##USAGE

1. Download the raw data zip file using the link in the RAW DATA section. Unzip the data zip file and it will create a data folder called "UCI HAR Dataset". On your computer change directory to "UCI HAR Dataset". Download the "run_analysis.R" under this data directory. 
2. Open R terminal or RStudio
3. Use the getwd() command to make sure the current directory is "UCI HAR Dataset". If not, use setwd("UCI HAR Dataset") to move to the data directory.
4. run library(plyr) command to make sure the "plyr" library is already installed. If not, use install.packages("plyr") to install the package first.
5. run source("run_analysis.R")
6. The final result data set is stored in the R object "data2." Also there is a tab-delimited text file "data.txt" created in the current directory.

The final "data2" object is a data.frame with 180 rows x 68 columns dimension. The 180 observation is a combination from 30 subjects and each of the 6 activities. The first column is the "Subject". The second column is the "Activity." All following columns are averages of each selected mean and standard deviation variables from the raw data.   

The CodeBook.md file is a code book that describes the variables, the data, and any transformations the "run_analysis.R" performed to clean up the data.   

To reuse the cleaned data in the future you can simply read in the data using the command:
 data<-read.table("data.txt", header=TRUE, check.names=F, sep="\t")

