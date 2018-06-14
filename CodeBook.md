The script works under the assumption that you have your code in a certain folder and 
that the data are stored in a directory with relative path "../UCI HAR Dataset" 
with respect to the path of the script.

Step 1.
The subject_train(test), y_train(test), and X_train(test) files are read from
..//UCI HAR Dataset/train(test) directories into 3(+3) separate dataframes.
The train and test related dataframes are merged separately by column, dftot_train and dftot_test.

Then merging dftot_train and dftot_test gives the total dataframe.

Step 2.
The variables name are read from the file located at ..//UCI HAR Dataset/features.txt 
and poured into a dataframe (dfnames).
dfnames is subset to have only the features names and 
a vector (vectornames) is initialised with the values of the remaining column in dfnames.
The elements of vctornames are assigned to the column names of df_total
A dataframe (df_skim) is initialised from df_total, 
selecting only columns with mean() and std() in their name (plus subject ID and ActivityLabel)

Step 3.
The activityLabels are read from the file located at ..//UCI HAR Dataset/activity_labels.txt 
and poured into a dataframe (dflabels) and a vector (labelnames) is initialised 
with the values of the second column of dflables.
Then the ActivityLabels values in df_skim are changed according to labelnames entries

Step 4.
Subtract, from the columns name, the characters (, ), - (substituted with a "." ) and changed all "t" to "Time" and all "f" to "Freq"

Step 5.
Group df_skim by SubjectID and Activity and rendered Tidy by means of "summarise_all" function used with the function "mean"

Returns the newly created tidy dataframe, df_tidy