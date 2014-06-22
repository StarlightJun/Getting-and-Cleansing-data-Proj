# This run_analysis.R assumes that the Samsung data is in current working directory.
# The output is the tidy data so finally "tidydata.txt" is generated in current working directory. 
# Overall flow is as follows
# 1. Load and Merges the training and the test sets to create one data set
#    which is an allXdata data frame( 10299 rows and 561 columns ).
#    - load 8 data sets into corresponding data frame. 
#    - Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#    - selectedXdata dataframe(10299 rows and 66 columns) which have the name 
#      of mean() and std() is extracted 
#    - and add corresponding initial columns' names matching features data frame
#      into selectedXdata dataframe.  
# 3. Uses descriptive activity names to name the activities in the data set 
#    so finally add activity description column into selectedXdata dataframe
#    making new data frame named alldata data frame(10299 rows and 67 columns).  
# 4. Appropriately labels the data set with descriptive variable names. 
#    - initial columns' names provided in step2 is replaced of more descriptive 
#      and correct R column names(removing (), +, - in column names) 
# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity(6 activities) and each subject(30 subject ids).
#    - add subjectid column related to 30 volunteers into alldata data frame 
#      creating a result data frame ( 10299 rows and 68 columns )
#    - and finally generate tidydata( 180 rows, 68 columns) with the average of 
#      each variable for each activity(6 activities) and each subject(30 subject
#      ids) as txt file named "tidydata.txt" in current working directory

# 1. Merges the training and the test sets to create one data set which is an 
#    allXdata data frame( 10299 rows and 561 columns ).

#   - load 8 data sets into corresponding data frame. 
Xtestdata <- read.csv("./test/X_test.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
ytest <- read.csv("./test/y_test.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
subjecttest <- read.csv("./test/subject_test.txt", header=FALSE, sep="", stringsAsFactors=FALSE)

Xtraindata <- read.csv("./train/X_train.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
ytrain <- read.csv("./train/y_train.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
subjecttrain <- read.csv("./train/subject_train.txt", header=FALSE, sep="", stringsAsFactors=FALSE)

activitylabels <- read.csv("./activity_labels.txt", header=FALSE, sep="", stringsAsFactors=FALSE)
features <- read.csv("./features.txt", header=FALSE, sep="", stringsAsFactors=FALSE)

#   - Merges the training and the test sets to create one data set.
allXdata <- rbind( Xtraindata,Xtestdata )                

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#    - selectedXdata dataframe(10299 rows and 66 columns) which have the name 
#      of mean() and std() is extracted 
columnindex <- sort( c( grep("mean\\(\\)", features$V2, ignore.case = TRUE), grep("std\\(\\)", features$V2, ignore.case = TRUE) ) )
selectedXdata <- allXdata[,columnindex]
#    - and add corresponding initial columns' names matching features data frame
#      into selectedXdata dataframe.
names(selectedXdata) <- features$V2[columnindex] # add column names from features

# 3. Uses descriptive activity names to name the activities in the data set 
#    so finally add activity description column into selectedXdata dataframe
#    making new data frame named alldata data frame(10299 rows and 67 columns). 
library(plyr)
allactivitylabels <- rbind( join(ytrain, activitylabels),
                            join(ytest, activitylabels) 
)
alldata <- cbind(activitydesc=allactivitylabels$V2, selectedXdata) # add activity description column 

# 4. Appropriately labels the data set with descriptive variable names. 
#    - initial columns' names provided in step2 is replaced of more descriptive 
#      and correct R column names(removing (), +, - in column names) 
names(alldata) <- gsub( "\\(\\)" , "" ,     # third, delete ending "()" 
         gsub( "\\(\\)_" , "_for_" ,   # second, replace inbetween "()" to "of"
               gsub("\\-" , "_" , names(alldata) # first, replace all "-" to "_"
               )
         )
      )           
# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity(6 activities) and each subject(30 subject ids).
#    - add subjectid column related to 30 volunteers into alldata data frame 
#      creating a result data frame ( 10299 rows and 68 columns )
subjectid <- rbind(subjecttrain, subjecttest)
names(subjectid) <- "subjectid"
resultdata <- cbind(subjectid, alldata)
resultdata$subjectid <- factor(resultdata$subjectid)
resultdata$activitydesc <- factor(resultdata$activitydesc, levels=activitylabels$V2)

#    - and finally generate tidydata( 180 rows, 68 columns) with the average of 
#      each variable for each activity(6 activities) and each subject(30 subject
#      ids) as txt file named "tidydata.txt" in current working directory
tidydata <- ddply(resultdata, .(activitydesc,subjectid), numcolwise(mean)) # 180 rows, 68 columns 
write.csv(tidydata, file="tidydata.txt", row.names=FALSE)
