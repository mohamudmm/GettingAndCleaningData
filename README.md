README
The script consists of four phases.
1. The first phase reads in the data from the file.Using the read.table() function we read in the three files in the test folder: subject_x, X_test,y_test.The three resulting vectors are combined into a dataframe using the cbind() function.
in a similar manner the corresponding files in the train folder are processed into dataframe.The two dataframes are combined using a rbind() function.