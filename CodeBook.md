CodeBook.md 
========================================================
```
Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit?degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
```

Overview and background
-------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Input files
-----------
This input files can be downloaded from following downloading sites: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

And the following files are needed to provide the train and test data. Their descriptions are equivalent.
### 1. 'train/X_train.txt' 
Training set

```
This has 7352 obs. of  561 variables(columns) and it is loaded to Xtraindata dataframe variable.
$ V1 ~ V$561  : numeric
```

### 2. 'train/y_train.txt'
Training labels aligned to one of 6 activities  
```
This has 7352 observations of  1 variable and it is loaded to ytrain dataframe variable
 $ V1: integer  5 5 5 5 5 5 5 5 5 5 ... ; integer between 1 ~ 6 could be mapped
 ```

### 3. 'train/subject_train.txt'
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
```
This has 7352 observations of  1 variable and it is loaded to subjecttrain dataframe variable.
 $ V1: integer  1 1 1 1 1 1 1 1 1 1 ...
```
### 4. 'test/X_test.txt'
Test set
```
This has 2947 observations of  561 variables(columns) and it is loaded to Xtestdata dataframe variable.
$ V1 ~ V$561  : numeric
```

### 5. 'test/y_test.txt'
Test labels aligned to one of 6 activities 
```
This has 2947 observations of  1 variable and it is loaded to ytest dataframe variable.
 $ V1: integer  5 5 5 5 5 5 5 5 5 5 ... ; integer between 1 ~ 6 could be mapped
```

### 6. 'test/subject_test.txt'
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
```
This has 2947 obserations of  1 variable and it is loaded to subjecttest dataframe variable. 
 $ V1: integer  2 2 2 2 2 2 2 2 2 2 ...
```

### 7. 'activity_label.txt' 
Links the class labels with their activity name ( there are 1~6 activitites). 

```
This has 6 obs. of  2 variables and it is loaded into activitylabels dataframe variable like below. 
 $ V1: integer  1 2 3 4 5 6
 $ V2: character  "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" ...
```

### 8. 'features.txt'
List of all features. Features are normalized and bounded within [-1,1]. Each feature vector is a row on the text file.

```
This has 561 obs. of  2 variables and it is loaded to features dataframe variable.
 $ V1: integer  1 2 3 4 5 6 7 8 9 10 ...
 $ V2: character  "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" ...
```

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ   
> tGravityAcc-XYZ   
> tBodyAccJerk-XYZ   
> tBodyGyro-XYZ   
> tBodyGyroJerk-XYZ   
> tBodyAccMag   
> tGravityAccMag   
> tBodyAccJerkMag   
> tBodyGyroMag   
> tBodyGyroJerkMag   
> fBodyAcc-XYZ   
> fBodyAccJerk-XYZ   
> fBodyGyro-XYZ      
> fBodyAccMag   
> fBodyAccJerkMag   
> fBodyGyroMag   
> fBodyGyroJerkMag   

> The set of variables that were estimated from these signals are: 

> mean(): Mean value   
> std(): Standard deviation   
> mad(): Median absolute deviation    
> max(): Largest value in array   
> min(): Smallest value in array   
> sma(): Signal magnitude area   
> energy(): Energy measure. Sum of the squares divided by the number of values.    
> iqr(): Interquartile range    
> entropy(): Signal entropy   
> arCoeff(): Autorregresion coefficients with Burg order equal to 4   
> correlation(): correlation coefficient between two signals   
> maxInds(): index of the frequency component with largest magnitude   
> meanFreq(): Weighted average of the frequency components to obtain a mean frequency   
> skewness(): skewness of the frequency domain signal    
> kurtosis(): kurtosis of the frequency domain signal   
> bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.   
> angle(): Angle between to vectors.   

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:   

> gravityMean   
> tBodyAccMean   
> tBodyAccJerkMean   
> tBodyGyroMean   
> tBodyGyroJerkMean 

Information processing Variable in R script 
--------------------------------------------
### 1. allXdata
dataframe variable to have inregrated observations about train and test data ( 10299 rows and 561 columns )
```
10299 observations of 561 variables 
$V1 ~ $10299 : numeric
```
### 2. allactivitylabels 
dataframe variable to have integrated activity labels about train and test data sets
```
10299 obs. of  2 variables:
 $ V1: integer  5 5 5 5 5 5 5 5 5 5 ...
 $ V2: character  "STANDING" "STANDING" "STANDING" "STANDING" ...
```
### 3. alldata
data frame variable to have integrated observations about train and test data adding  activity description column ( 10299 rows and 67 columns )
```
 $ activitydesc : Factor w/ 6 levels "LAYING","SITTING",..
 $ tBodyAcc_mean_for_X ~ other variables : numeric
 
```
### 4. resultdata
data frame variable having combined observations about test and train data sets and including activity desciption column and subjectid as factor variables
```
10299 obs. of  68 variables:
 $ subjectid  : Factor w/ 30 levels "1","2","3","4",.."30"
 $ activitydesc  : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..
 $ tBodyAcc_mean_for_X  ~ other variables  : numeric 
 
```
### 5. selectedXdata
data frame variable having combined test and train data with extracted columns for mean() and std()
```
10299 obs. of  66 variables
 $ tBodyAcc-mean()-X ~ other variables : numeric
```

### 6. subjectid
dataframe variable having person id for every observations( merging test and train subject id data ). 
```
10299 obs. of  1 variable:
 $ subjectid: int  1 1 1 1 1 1 1 1 1 1 ...
```
### 6. other variables
#### Xtestdata : refer to 'X_test.txt'
#### Xtraindata : refer to 'X_train.txt'
#### activitylabels : refer to 'activity_labels.txt'
#### features : refer to ' features.txt'
#### subjecttest : refer to 'subject_test.txt'
#### subjecttrain : refer to 'subject_train.txt'
#### tidydata : refer to 'tidydata.txt'
#### ytest : refer to y_test.txt'
#### ytrain : refer to y_train.txt'


Output file
------------
### 1. 'tidydata.txt' 
The average(the mean and standard deviation) of each variable for each activity( mapped to 6 activities in 'activity_label.txt') and each subject( mapped to 30 volunteers dividing traning and test sets via 'y_train.txt' or 'y_test.txt').  
```
This has 180 obs. of  68 variables and it is loaded to tidydata dataframe variable like below. And 1st column named activitydesc and 2nd column subjectid is mapped to factor variable for summarization and grouping. 

 $ activitydesc             : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ subjectid                : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ tBodyAcc_mean_for_X ~ other variables : numeric 
```
### 2. How to reload generated 'tidydata.txt' to R 
If you would like to reload the generated 'tidydata.txt' into R, you can use following script as samples.
```
loadtidy <- read.csv("tidydata.txt")
loadtidy$subjectid <- factor(loadtidy$subjectid)
loadtidy$activitydesc <- factor(loadtidy$activitydesc, levels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
```