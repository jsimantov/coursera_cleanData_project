# CodeBook
## coursera_cleanData_project

File run_analysis.R performs the following, in order:
  1. Defines names for the final output and intermediate working files
  2. Downloads the indicated dataset, if it has not already been downloaded; if the data set is found in the working directory, this file is being used instead.
  3. Unzips the dataset in a sub-folder
  4. Reads the train and test datasets and merges them into a single, global dataset
  5. Merges Feature and Activity data into the global dataset
  6. Retrieves data columns containing Mean and StdDeviation values
  7. Modifies the column names of the global dataset to make them more explicit and readable
  8. Calculates Mean and Standard Deviation values for each measurement Subject and Activity
  9. Produces an output file tidy_set.txt containing the required result.
