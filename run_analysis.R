# Extract all features, ie. varialbes used by both training and test set
features<-read.table("features.txt", header=F, stringsAsFactors = F)
feature_name<- features$V2

# Extract activity labels for testing and training subjects
activity_labels<-read.table("activity_labels.txt", stringsAsFactors = F)
activity_labels<-activity_labels$V2

## Step 1. Merges the training and the test sets to create one data set.

# Create data for training subjects variables
X_train<-read.table("train/X_train.txt", stringsAsFactors = F)
names(X_train)<-feature_name

# Extract Subject id for training subjects
subject_train<-read.table("train/subject_train.txt")

# Extract activities for training subjects
y_train<-read.table("train/y_train.txt")
y_train<-as.factor(y_train$V1)

# Combine all columns to make the complete training data frame
train<-cbind(X_train, subject=subject_train$V1, activity=y_train)

# Repeat the same procedure to create complete test data frame
# Extract data for test subjects
X_test<-read.table("test/X_test.txt", stringsAsFactors = F)
names(X_test)<-feature_name
y_test<-read.table("test/y_test.txt", stringsAsFactors = F)
y_test<-as.factor(y_test$V1)
subject_test<-read.table("test/subject_test.txt")
test<-cbind(X_test, subject=subject_test$V1, activity=y_test)

# Combine test and train
data<-rbind(train,test)

## Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
ncol <- ncol(data)
index_feature<-grep("(mean|std)[(][)]", feature_name)
data<-data[, c(index_feature, (ncol-1):ncol)]

## Step3. Uses descriptive activity names to name the activities in the data set instead of numbers
levels(data$activity)<-activity_labels

## Step4. Appropriately labels the data set with descriptive variable names
# column names are already self-explaining and are further described in the code book.
#removing "()" from column names.
colnames<-names(data)
colnames<-gsub("mean[(][)]", "Mean", colnames )
colnames<-gsub("std[(][)]", "Std", colnames )
#Replace "-" with "." to make valid names
colnames<-gsub("-", ".", colnames)
names(data)<-colnames

## Step5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
data2<- ddply(data, .(subject, activity), numcolwise(mean))
levels(data2$activity)<-activity_labels

write.table(data2, "data.txt", quote=FALSE, row.names=FALSE, sep="\t")

