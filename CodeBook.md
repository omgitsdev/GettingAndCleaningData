#Code Book

* Data contained in the Test and Train folders are read into local variables. Split by X and Y values
* All X and all Y values are combined (independently)
* The `grep` function is used to identify the subsets of data which contain either mean (`mean`) or standard deviation (`std`). Note that `grep` is called for mean as `mean[^F]` in order to not retrieve values in the 'meanFreq' subset.
* lables are assigned
* Lables are cleaned up to make human readable using the `gsub` method: Column names are capitalized and errant slashes or hyphens are removed.
* Mean of data is output to a text file.