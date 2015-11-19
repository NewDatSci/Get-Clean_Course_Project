# Get-Clean_Course_Project

## What's the clean data?

Use the following R code to run the clean data, and please check Codebook.md for the variables.

*address <- "https://s3.amazonaws.com/coursera-uploads/user-21cdfa4b8370e98b9f65ec62/975118/asst-3/5355ac308dec11e5a0cd05002c86e52b.txt"*

*address <- sub("^https", "http", address)*

*data <- read.table(url(address), header = TRUE)*

*View(data)*

## How to run the R script?

The scrip run_analysis.R can be run as long as the Samsung data folder is your working directory



and any assumptions about the raw data set along with a high-level synopsis or outline of the processing steps.
