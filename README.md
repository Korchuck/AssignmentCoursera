# AssignmentCoursera

My assignment consists of four files: 

1. run_analysis.R, which executes the excercises of the course project. 
 
1.1 Merge the training and the test sets to create one data set
I upload six text files from the zip file and I store them into six data frames (using the read.table function)
Then I simply concaminate the files accordingly into train and test data sets.
To merge all of the data, I transform once again the concaminated data sets into data frames and I merge them by using rbind command.

1.2 Extract only the measurements on the mean and standard deviation for each measurement
I upload the features.txt data which contains the name of variables and which displays what measurement is mean or std.
In order to know which column is either mean or std I use the "grep" function, and then I substract from the whole data sets only the variables which contain the word "mean" or "std". 

1.3. Use descriptive activity names to name the activities in the data set
I upload a text file with the names of the activities and then I merge the whole data set with the "activity" data frame by the columns which contain the ids of activities (1-6).
In order to have just one variable describing the names of the activities I delete the column with the ids (X562)

1.4. Appropriately label the data set with descriptive variable names
I add two additional rows to the "features1" , because in the course of this assignment the preliminary data set was enlarged by two variables - describing the activities (which I call "Label") and a person (who I call "Subject").
Then I transform a little the elements of the "features1" - I delete all of the "-", "()" and "," using the "gsub" function. The names of the variables are a little bit confusing so I thought that "cleaning" them would be appropriate.
In order to assign the variable names from the "features_final3" I simply perform the colnames() function. 

1.5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
Firstly I use "group_by" function to group the observations by the "Subject" and "Label" column and to that groups I apply the "mean" function which is done by the "summarise_each" function. 

2. Codebook - contains the codebook which is a transformation of the promptData(final_final) output. 

3. Assigment_MK.txt file - tidy data file, created by using the function "write.table". 

4. This README file :-)

