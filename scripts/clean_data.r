# Load libraries
library(readr)

# Modify dataframe structures
modify_frame <- function(path){
    full_path <- paste("input/org/", path, sep = "")
    file <- read.csv(full_path)

    # Reverse the dataframes
    file <- apply(file, 2, rev)
    file <- as.data.frame(file)

    # Modify datatypes
    file$Return <- parse_number(file$Change..)
    file$Price <- parse_number(file$Price)
    file$Change.. <- NULL
    file$Date <- strptime(file$Date, format = "%m/%d/%Y")

    # Save modified dataframe as csv file
    new_path <- paste("input/mod/","Modified ", path, sep = "")
    write.csv(file, new_path)
}

# Iterate over each file
files <- list.files(path="input/org", pattern=NULL, all.files=FALSE, full.names=FALSE)
for (file in files){
    modify_frame(file)
}