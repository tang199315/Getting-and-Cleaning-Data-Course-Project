# Getting and Cleaning Data Course Project
This is the course project for the Getting and Cleaning Data Coursera course.

## File Description
* `run_analysis.R` is the R script to preprocess raw data to a tidy data set which is ready for downstream analysis.
* `preprocessed_data_set.txt` is the preprocessed tidy data set as an output from  `run_analysis.R`.
* `code_book.md` is the code book for the data set `preprocessed_data_set.txt`.
* `feature_info.txt` is a reference file for some data fields description in `code_book.md`.

## R script
The `run_analysis.R` does the following.
1. Merges the training and the test sets to create one data set;
2. Extracts only the measurements on the mean and standard deviation for each measurement;
3. Uses descriptive activity names to name the activities in the data set;
4. Appropriately labels the data set with descriptive variable names;
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
