========================================================================================================================
Detailed Explanation of the Analysis File
=========================================================================================================================
Step 1
=======
We proceed with the run_analysis.R by reading the multiple training and test dataset into R. We list the datasets below:
1. X_test.txt: Test set:
2. y_test.txt: Test labels i.e. These are different activities performed by individuals
3. X_train.txt: Training set
4. y_train.txt: Training labels. i.e. These are different activities performed by individuals
5. subject_test.txt: individuals ids for test dataset
6. subject_train.txt: individuals ids for training dataset
7. features.txt: These are 561 features if X_test.txt and X_train.txt
8. activity_labels.txt: Activity labels
========
Step 2
========
We merge the data sets by doing the following
1. Rename the columns of X_test and y_test using the 561 rows in features.txt. 
2. Merge the test data, by merging: subject_test.txt, X_test.txt and y_test.txt
3. Merge the training data, by merging: subject_train.txt, X_train.txt and y_train.txt
4. I rename the first and second column of data from 2. and 3. (in Step 2) above to "id" and "activity" respectively
5. I bind data from 2. and 3. (in Step 2) and I call it fullData


==========
Step 3
==========
I perform additional cleaning based on the question
1. For the fullData, I keep only columns that reflects the measurements on the mean/standard deviation for each measurement. 
2. I use descriptive activity names from  "activity_labels.txt" dataset  to label column 2 of fullData

=========
Step 4
========
I create a tidy dataset by averaging each variable (measurements on the mean/standard deviation in Step 3: 1)  for each activity and each subject, I call this " newfulldata ". After doing all this, we are left with 180 observations and 81 variables (columns)
