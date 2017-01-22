# Getting-And-Cleaning-Data-Course-Project

This file describes the activities for the final course project.

# Assumptions
Using this data requires download of a data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and assumes that this has been unzipped to the current working directory. 

#Overview
The directory contains a script run_analysis.R that reads in the data from the unzipped data source. The script then cleans and merges training and test data into one data set. It retains only mean and std variables from each record. It also merges in subject and activity information into the data set. Finally, it groups the data by subject and activity and then computes means across all variables and writes them out. Sample output is in the tidyMeanData.txt file.

The CodeBook.md file contains more information about variables in run_analysis.R.
