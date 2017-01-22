# This file describes the variables and operation of the run_analysis.R script

# Downloaded Data
testRawData, testActivities, testSubjects, trainRawData, trainActivities, trainSubjects, rawVariableNames, and activityLabels
are loaded with data from the sources.

#Intermediary Variable
requiredVariables is populated with an index of based on a search of the rawVariableNames for elements that contain 
mean and std information

requiredVariableNames is populated with the cleaned Variable Name data using the index in requiredVariables

#Output
completeDataSet is a merged set of test and training data with subject and activity information added as well

meanData is a summarized set of data that contains a mean of each variable grouped by subject and activity

#Operation
1. The raw activity data is loaded in and a clean set of Variable Names is generated.
2. The test and training raw sensor data, subject information, and activity information is loaded in
3. Activity lists are improved to have readable activity names instead of a numeric index.
4. Unwanted variables are dropped from the test and train raw sensor data (keeping only mean and std variables)
5. The raw sensor data is combined with subject and activity data. This creates a complete test data set and a train data set.
6. The test and train data set are merged into the CompleteDataSet
7. A new data set is calculated (meanData) that has means calculated for each variable and are grouped by Subject and Activity
8. The new data set is written out to disk.


