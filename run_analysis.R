library(dplyr)

## Read in raw training set
TrainSet <- read.table("./train/x_train.txt")

## Reading in variable and activity labels
c <- read.table("features.txt")
b <- read.table("activity_labels.txt")

## Reading in activity labels for training
a <- read.table("./train/y_train.txt")
d <- read.table("./train/subject_train.txt")
ActLblTrain <- merge(a,b,by = "V1",all.x = TRUE, sort = FALSE)


## Row and column lablled
TrainSet1 <- cbind(d,ActLblTrain[,2],TrainSet)
### STEP 3 Part 1 done ###
names(TrainSet1) = c("Subject","Activity", as.character(c$V2))
### STEP 4 Part 1 done ###
### Variable name meaning will be explained in the codebook ###

## Read in raw test set
TestSet <- read.table("./test/x_test.txt")

## Reading in activity labels for test
a <- read.table("./test/y_test.txt")
d <- read.table("./test/subject_test.txt")
ActLblTest <- merge(a,b,by = "V1",all.x = TRUE, sort = FALSE)

## Row and column lablled
TestSet1 <- cbind(d,ActLblTest[,2],TestSet)
### STEP 3 Part 2 done ###
names(TestSet1) = c("Subject","Activity", as.character(c$V2))
### STEP 4 Part 2 done ###

## Combine Training and Test sets, 
TestTrainSet <- rbind(TrainSet1,TestSet1)
### STEP 1 done ###

## Subsetting data with only mean() and std() variables
ColToSubset = c(1,2, grep("mean\\(\\)",names(TestTrainSet)), grep("std\\(\\)",names(TestTrainSet)))
TestTrainSet1 <- TestTrainSet[,ColToSubset]
### STEP 2 done ###

## TidyData takes the average of the variable by unique Subject and Activity pairs
TidyData <- group_by(TestTrainSet1,Subject,Activity)%>% summarise_each(funs(mean))
## STEP 5 done ###

## Write to file
write.table(TidyData,"Tidy_Data.txt", row.name = FALSE)
