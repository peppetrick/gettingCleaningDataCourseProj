---
title: "Readme.md"
author: "Giuseppe Tricarico"
date: "Friday, September 25, 2015"
output: html_document
---

# Code Book for Course Project

Code Book for Getting And Cleaning Data couse project

##General Description of the script

The script must be run in the same directory of data set. 
The script is organized in the following step

1. Read data common to train and test data set, files feature.txt and activity_labels.txt, in data frame **features** and **activity_labels** respectively.

2. **Read test set (according to processing required in the project description)**  
  * Create **subject_test** data frame loading **subject_test.txt** data file.
	* Create **activity_test** data frame to store activity for the test data set  reading **./test/y_test.txt**  file
	* Create **test_set** data frame to  store processed measurement by reading **./test/X_test.txt**

3. **Read train set (according to processing required in the project description)** 
	* Create **subject_train** data frame loading **subject_train.txt** data file.
	* Create **activity_train** data frame to store activity for the test data set  reading **./train/y_train.txt**  file
	* Create **train_set** data frame to  store processed measurement by reading **./train/X_train.txt**

4. **Bind train and test data set and assign name to columns**
	* **total_set** object is obtained by rbinding test and train data set.
	* **subject_total** contains the subject of the *total* data set
	* **activity_total** contains the activity of the *total* data set
	* **total_mean_std** select only *mean* and *std* measurement from data set, activity_label and subject columns are added
	* **total_mean_std_activity** adds activity label
5.	Create the new data set **result_data_set** with processed measurement in rows, and summarize by activity,subject,variable.
	 
	


	CodeBook
	
	
	
 **feature**			stores the name of the processed measurement, the data frame has two columns "Code" and "Label"
 **activit_labels**	stores codes and names of activity,the data frame has two columns "Code" and "Label"
 **subject_test**	a vector that store the subject for test measurement
 **activity_test**	a vector that store the activity code for test measurement
 **test_set**		a data frame that stores processed measurement in columns (variable stored in feature vector), by activity and subject.

 **subject_train**	a vector that store the subject for train measurement
 **activity_train**	a vector that store the activity code for train measurement
 **train_set**		a data frame that stores processed measurement in columns (variable stored in feature vector), by activity and subject.
	
 **total_set**		same structure of train_set and test_set. Bind by rows the two data frame
 **subject_total**	a vector that store the subject for the complete set of measurement
 **activity_total**	a vector that store the subject for the activity set of measurement
 **total_mean_std**	select only *mean* and *std* processing from the total measurement 
	
 **total_mean_std_activity**		add activity labels columns  to total_mean_std
	
 **total_melt**		organize the data frame by putting variable names in rows, the field of data frame are (*Label*: activity name labels,*subject*: the subject of measurement,*variable*: the name of measurement,*value*: the value of measurement for the variable)
	
 **result_data_set** summarize total_melt by Label, subject and Variable, the field of data frame are (*Label*: activity name labels,*subject*: the subject of measurement,*variable*: the name of measurement,*mean*: the mean for each variable)