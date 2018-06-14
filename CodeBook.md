Data referred to experiments  carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

See readme.txt from the original repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


1) The data have been merged between test and train.
2) activity label numbers changed to the corresponding label  
3) Only variables with "mean()" or "std()" have been selected
4) The names of the variables have been cleaned up from special characters and given more meaningful names
(Time insted of t and Freq instead of f)
5) The mean of each observables has been computed per each subject and each ActivityType, so that a tidy dataset is returned. with the SubjectID, ActivityTipe and Mean of Mean and Mean of STD for each observable retained at point 4.



