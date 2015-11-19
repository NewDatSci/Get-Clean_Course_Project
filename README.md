# Get-Clean_Course_Project :notebook:

## What's the clean data?

Use the following R code to run the clean data, and please check Codebook.md for the variables.

```
address <- "https://s3.amazonaws.com/coursera-uploads/user-21cdfa4b8370e98b9f65ec62/975118/asst-3/5355ac308dec11e5a0cd05002c86e52b.txt"*

address <- sub("^https", "http", address)

data <- read.table(url(address), header = TRUE)

View(data)
```

## How to run the R script?

The scrip run_analysis.R can be run as long as the Samsung data folder **UCI HAR Dataset** is your working directory

R version used is 3.2.2 (2015-08-14), wtih the base  and *dplr* package installed.

## Assumptions about the raw data set 

The data from the measurements were recorded correctly. The Fourier Transform and stats summary such as means and standard deviations were calculated correctly. No checks were performed on the data for validity.

## The outline of the processing steps in the script

We are required to carry out the following 5 steps to make a tidy data.

>1. Merges the training and the test sets to create one data set.
>2. Extracts only the measurements on the mean and standard deviation for each measurement. 
>3. Uses descriptive activity names to name the activities in the data set. 
>4. Appropriately labels the data set with descriptive variable names. 
>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In the script they are achieved via the following proess:

1. Load in *dplyr* library for using this *summarise* and *group_by* function later. 
2. Read in raw training data into table
3. Read in the features(measurment variable label) and activity label file into tables
4. Read in the training set's Subject and Activity variables into tables.
5. Use *merge* to transform training set Acitivy variable into descriptive named factors according to activity label rule
  - This achieves the training set part of Step 3 in the requirement 
6. Column bind the Subject and descriptive Activity variables with the traing set data
7. Set the names of the training data variables according to the features data.
  - The achives the training set part of Step 4 in the requirement
8. Read in raw test data into table
9. Read in the test set's Subject and Activity variables into tables.
10. Use *merge* to transform test set Acitivy variable into descriptive named factors according to activity label rule
  - This achieves the test set part of Step 3 in the requirement 
11. Column bind the Subject and descriptive Activity variables with the test set data
12. Set the names of the test data variables according to the features data.
  - The achives the test set part of Step 4 in the requirement
13. Row bind Training and Test datasets into one dataset
  - This completes Step 1 in the requirement
14. Find the columns that have names with "mean()" and "std()" using *grep*
15. Create a new dataset by subsetting the Subject, Activity and the columns with "mean()" and "std()" in their names.
  - This completes Step 2 in the requirement
16. Use *group_by* to group the data set by unique Subject and Activity pair and use *summarise* to take the average of the measurement variables by the unique paires. This creates the final tidy dataset.
  - This completes Step 5 in the requirement
17. Write the final tidy dataset into file.




