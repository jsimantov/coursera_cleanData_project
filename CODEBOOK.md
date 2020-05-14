# Codebook

## Scope

As per the course project directives, data used for the project represent data collected from the accelerometers from the Samsung Galaxy S smartphone, downloaded from site:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The aim of the project analysis is to present, for a set of unnamed subjects(persons), a one-line record including the subject identifier, the type of activity he was performing, and a series of measurements collected from the subject's smartphone accelerometers.

The logical data structure is described in the Source Data section; initial raw-data variables and data header transformations are listed in the Output Data section.

Data download, analysis and output were carried out using the script run_analysis.R, this repository; the list of functionalities in the script can be found in file README.md, together with additional background information on this project.

##Source Data

Detailed description of the dataset is provided on site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###Variables

Subject numerical identifier, integer, range 1 to 30.

Activity descriptor, string, 6 possible explicit values:

  WALKING
  WALKING_UPSTAIRS
  WALKING_DOWNSTAIRS
  SITTING
  STANDING
  LAYING

Measurement variable Name and description list are included in files features.txt and features_info.txt of the raw data set; they are briefly summarized here.

Data collected were classified in two groups:

  Time-domain data, collected from accelerometer and gyroscope raw signals.
  Frequency-domain signals, resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.
 
Raw acceleration measurements are expressed in g's (9.81 m.s⁻²).
Raw gyroscope measurements are expressed in radians / second (rad.s⁻¹).

Prior to analyzing, all measurements were normalized in range [-1,1] and are expressed as floating-point values

Three-dimensional signal Magnitudes were geometrically calculated.

##Output Data
Raw data retrieval, analysis and formatting were created using the functionalities included in script run_analysis.R
The formatting of the final data headers comprises the following actions:

- Expanding the abbreviated item names in the Raw data headers to more explicit and meaningful values
- Removing special and regular character expressions from the Raw Data Headers
- Adding Spaces and Dashes to create more readable header labels

The final data labels are:

- The prefix 'TD' indicates time-domain values; the prefix 'FD' indicates frequency-domain values
"Subject"
"Activity"
"TD Body Accelerometer - Mean X"                        
"TD Body Accelerometer - Mean Y"                       
"TD Body Accelerometer - Mean Z"                        
"TD Body Accelerometer - StdDeviation X"               
"TD Body Accelerometer - StdDeviation Y"
"TD Body Accelerometer - StdDeviation Z"
"TD Gravity Accelerometer - Mean X"
"TD Gravity Accelerometer - Mean Y"
"TD Gravity Accelerometer - Mean Z"
"TD Gravity Accelerometer - StdDeviation X"            
"TD Gravity Accelerometer - StdDeviation Y"
"TD Gravity Accelerometer - StdDeviation Z"
"TD Body Accelerometer Jerk- Mean X"
"TD Body Accelerometer Jerk- Mean Y"
"TD Body Accelerometer Jerk- Mean Z"
"TD Body Accelerometer Jerk- StdDeviation X"
"TD Body Accelerometer Jerk- StdDeviation Y"
"TD Body Accelerometer Jerk- StdDeviation Z"
"TD Body Gyroscope - Mean X"
"TD Body Gyroscope - Mean Y"
"TD Body Gyroscope - Mean Z"
"TD Body Gyroscope - StdDeviation X"                   
"TD Body Gyroscope - StdDeviation Y"
"TD Body Gyroscope - StdDeviation Z"                   
"TD Body Gyroscope Jerk- Mean X"
"TD Body Gyroscope Jerk- Mean Y"                       
"TD Body Gyroscope Jerk- Mean Z"
"TD Body Gyroscope Jerk- StdDeviation X"               
"TD Body Gyroscope Jerk- StdDeviation Y"
"TD Body Gyroscope Jerk- StdDeviation Z"               
"TD Body Accelerometer  Magnitude - Mean "
"TD Body Accelerometer  Magnitude - StdDeviation "     
"TD Gravity Accelerometer  Magnitude - Mean "
"TD Gravity Accelerometer  Magnitude - StdDeviation "  
"TD Body Accelerometer Jerk Magnitude - Mean "
"TD Body Accelerometer Jerk Magnitude - StdDeviation " 
"TD Body Gyroscope  Magnitude - Mean "
"TD Body Gyroscope  Magnitude - StdDeviation "         
"TD Body Gyroscope Jerk Magnitude - Mean "              
"TD Body Gyroscope Jerk Magnitude - StdDeviation "     
"FD Body Accelerometer - Mean X"
"FD Body Accelerometer - Mean Y"                       
"FD Body Accelerometer - Mean Z"
"FD Body Accelerometer - StdDeviation X"               
"FD Body Accelerometer - StdDeviation Y"
"FD Body Accelerometer - StdDeviation Z"               
"FD Body Accelerometer Jerk- Mean X"
"FD Body Accelerometer Jerk- Mean Y"                   
"FD Body Accelerometer Jerk- Mean Z"
"FD Body Accelerometer Jerk- StdDeviation X"           
"FD Body Accelerometer Jerk- StdDeviation Y"
"FD Body Accelerometer Jerk- StdDeviation Z"           
"FD Body Gyroscope - Mean X"
"FD Body Gyroscope - Mean Y"                           
"FD Body Gyroscope - Mean Z"
"FD Body Gyroscope - StdDeviation X"                   
"FD Body Gyroscope - StdDeviation Y"
"FD Body Gyroscope - StdDeviation Z"                   
"FD Body Accelerometer  Magnitude - Mean "
"FD Body Accelerometer  Magnitude - StdDeviation "     
"FD Body  Accelerometer Jerk Magnitude - Mean "
"FD Body  Accelerometer Jerk Magnitude - StdDeviation "
"FD Body  Gyroscope  Magnitude - Mean "
"FD Body  Gyroscope  Magnitude - StdDeviation "        
"FD Body  Gyroscope Jerk Magnitude - Mean "
"FD Body  Gyroscope Jerk Magnitude - StdDeviation "    
                                       
> 
