# Clear workspace
rm(list=ls())

# Clear console
cat("\014")

# Set Working Directory
setwd("E:/0-Module 10 - Final Capstone/Yelp Project")

# Load Libraries
# library(rjson)
# library(RJSONIO)
library(jsonlite)

# Define functions
fReadNSaveJSON <- function(datafile, pgsize = 1000, RDSName) {
  con <- file(datafile, "r")
  JSON_df <- stream_in(con, handler = NULL, pagesize = pgsize, verbose = TRUE)
  JSON_df <- flatten(JSON_df, recursive = TRUE)
  saveRDS(JSON_df, RDSName)
  close(con)
  closeAllConnections() # Close all connections
}

## PART 1

# Start Timer
StartTime <- Sys.time()

# Define file variables
business_json_file <- "yelp_academic_dataset_business.json"
checkin_json_file <- "yelp_academic_dataset_checkin.json"
review_json_file <- "yelp_academic_dataset_review.json"
tip_json_file <- "yelp_academic_dataset_tip.json"
user_json_file <- "yelp_academic_dataset_user.json"

# Read the raw JSON data into a Data Frame and save to RDS format
fReadNSaveJSON(business_json_file, 10000, "business_df.rds")
fReadNSaveJSON(checkin_json_file, 10000, "checkin_df.rds")
fReadNSaveJSON(review_json_file, 50000, "review_df.rds")
fReadNSaveJSON(tip_json_file, 50000, "tip_df.rds")
fReadNSaveJSON(user_json_file, 50000, "user_df.rds")

# Show Elapsed Time in Sec
EndTime <- Sys.time()
difftime(EndTime, StartTime, units = c("secs"))

## PART 2

# Start Timer
StartTime <- Sys.time()

# Read the JSON data from RDS files
business_df <- readRDS("business_df.rds")
checkin_df <- readRDS("checkin_df.rds")
review_df <- readRDS("review_df.rds")
tip_df <- readRDS("tip_df.rds")
user_df <- readRDS("user_df.rds")

# Show the info of the data frames
str(business_df)
str(checkin_df)
str(review_df)
str(tip_df)
str(user_df)

# Show Elapsed Time in Sec
EndTime <- Sys.time()
difftime(EndTime, StartTime, units = c("secs"))
