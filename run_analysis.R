library(dplyr)
##Step 1 && 4
##Create a joint data frame from train data set and test data set,
##then label the data frame with feature variable names
variableList <- as.character(read.table("features.txt")[[2]])
trainDataset <- read.table("train/X_train.txt", col.names = variableList)
testDataset <- read.table("test/X_test.txt", col.names = variableList)
Dataset <- rbind(trainDataset, testDataset)

##Read the activityid sequence
trainActivityID <- read.table("train/y_train.txt", col.names = "activityID")
testActivityID <- read.table("test/y_test.txt", col.names = "activityID")
ActivityID <- rbind(trainActivityID, testActivityID)

##Read the activityid ~ activity mapping table
activityLabel <- read.table("activity_labels.txt", 
                            col.names = c("activityID", "activity"))

##Read the subject id sequence
trainSubjectID <- read.table("train/subject_train.txt", col.names = "subjectID")
testSubjectID <- read.table("test/subject_test.txt", col.names = "subjectID")
SubjectID <- rbind(trainSubjectID, testSubjectID)


##Step2
##Extracts only the measurements on the mean and standard deviation 
##for each measurement using regular expression
tbl_Dataset <- tbl_df(Dataset) %>% select(grep("mean\\(\\)|std\\(\\)",variableList))

##Step3
##Uses descriptive activity names to name the activities in the data set
tbl_Dataset <- tbl_df(cbind(ActivityID, tbl_Dataset))
##merge two data frame in terms of activityid,
##then remove the column of activityIid
tbl_Dataset <- full_join(tbl_Dataset, activityLabel ) %>%
            select(-1)

##Step5
##Create a independent tidy data set with the average 
##of each variable for each activity and each subject
tbl_Dataset_avg <- group_by(tbl_df(cbind(SubjectID, tbl_Dataset)), subjectID, activity)
tbl_Dataset_avg <- summarise_each(tbl_Dataset_avg, funs(mean))
subFeatureList<- variableList[grep("mean\\(\\)|std\\(\\)",variableList)]
write.table(tbl_Dataset_avg, "preprocessed_data_set.txt",
            col.names = c("subject", "activity", subFeatureList),
            quote = FALSE, row.names = FALSE) 
