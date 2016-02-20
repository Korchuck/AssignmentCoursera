**CodeBook**

**Original data and its source**
In the assignment I use data from:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

**Description of the data:**
he experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**Transformation of the data**
1.1 Merge the training and the test sets to create one data set 

I upload six text files (X_test.txt,y_test.txt,y_train.txt,X_train.txt,subject_test.txt,subject_train.txt) from the zip file and I store them into six data frames (using the read.table function) Then I simply concaminate the files accordingly into train and test data sets. To merge all of the data, I transform once again the concaminated data sets into data frames and I merge them by using rbind command.

The result is a data frame which cointains both data sets from the train and test set of the original dataset ("final").

1.2 Extract only the measurements on the mean and standard deviation for each measurement 

I upload the features.txt data which contains the name of variables and which displays what measurement is mean or std. In order to know which column is either mean or std I use the "grep" function, and then I substract from the whole data sets only the variables which contain the word "mean" or "std".

The result is a data frame which contains only the variables of meand and std ("final2")

1.3. Use descriptive activity names to name the activities in the data set 

I upload a text file with the names of the activities and then I merge the whole data set with the "activity" data frame by the columns which contain the ids of activities (1-6). In order to have just one variable describing the names of the activities I delete the column with the ids (X562)

The result is a data set with the trasnformed column "Label" in the dataset which cointains now names of the activities instead of just numbers ("final3").

1.4. Appropriately label the data set with descriptive variable names

I add two additional rows to the "features2" , because in the course of this assignment the preliminary data set was enlarged by two variables - describing the activities (which I call "Label") and a person (who I call "Subject"). Then I transform a little the elements of the "features2" - I delete all of the "-", "()" and "," using the "gsub" function. The names of the variables are a little bit confusing so I thought that "cleaning" them would be appropriate. In order to assign the variable names from the "features_final3" I simply perform the colnames() function.

The result is a data set from 1.3. but the variables have appropriate descriptive names (again "final3")


1.5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject 

Firstly I use "group_by" function to group the observations by the "Subject" and "Label" column and to that groups I apply the "mean" function which is done by the "summarise_each" function.

The result is a data frame "final_final". 

**Tidy data set**

"Assignment_MK.txt" contains average of the obseravtions for every subject and activity (30X6=180).
