# GettingAndCleaningData

Repository for course project of "Getting and Cleaning Data" by Johns Hopkins University via Coursera.

[More information](https://class.coursera.org/getdata-012)

<hr>

The script contained in 'run_analyss.R' will download the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html). The data contains motion data collected from a smartphone about 30 subjects during a variety of activities. More information is avaialable at the links above.

<hr>
The script will:

* automatically check for the presence of the necessary data 
* download and unpack the data if necessary
* combine the testing and training datasets
* extract just the information regarding mean and standard deviation values
* Assign human-readable headings
* Output a tidy-data file

execution of the script requires R which can be obtained from [http://www.r-project.org/](http://www.r-project.org/)