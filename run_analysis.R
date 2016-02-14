### 1. Merge the training and the test sets to create one data set.

### Read the data

X_test<-read.table("X_test.txt", sep="", header=FALSE)
y_test<-read.table("y_test.txt", sep="", header=FALSE)
y_train<-read.table("y_train.txt", sep="", header=FALSE)
X_train<-read.table("X_train.txt", sep="", header=FALSE)
subject_test<-read.table("subject_test.txt", sep="", header=FALSE)
subject_train<-read.table("subject_train.txt", sep="", header=FALSE)

### Merge them

test<-c(X_test, y_test, subject_test)

train<-c(X_train, y_train, subject_train)

test<-data.frame(matrix(unlist(test), nrow=2947))

train<-data.frame(matrix(unlist(train), nrow=7352))


final<-rbind(test,train)
final

### 2. Extract only the measurements on the mean and standard deviation for each measurement

## read the measurements
features<-read.table("features.txt", sep="", header=FALSE)
features1<-paste(features$V1, features$V2, sep="_")


mean<-grep("mean", features1)
std<-grep("std", features1)


measurements<-c(mean,std)
sort(measurements)

##"measurements" tells me in which column of "final" I find mean and std. Now I need to extract them.

final2<-final[,c(measurements)]
final2

#### 3. Use descriptive activity names to name the activities in the data set

## read the descriptive activity names

activity<-read.table("activity_labels.txt", sep="", header=FALSE)

## Merge the data set with the descriptive activity names and delete the unnecessary column with the numbers instead of names of a particular activity
final3<-merge(final, activity, by.x = "X562", by.y = "V1")
final3<-subset(final3, select=-X562)
final3


#### 4. Appropriately label the data set with descriptive variable names.

## I need to add two rows to the "features_final" with the variable names (in order to name the activity and label variables)

newrows<-c("Subject", "Activity")

features1<-c(features1,newrows)

## I transform a little variable names

features_final1<-gsub("-", "", features1)
  
features_final2<-gsub("()", "", features_final1, fixed=TRUE)
features_final3<-gsub(",", "", features_final2, fixed=TRUE)

## and now I change the variable names from "final3" to the names listed in "features_final3"

colnames(final3)<-features_final3
final3

##### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

final_final<- final3 %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean))


final_final


