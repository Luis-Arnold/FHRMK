# Set working directory
setwd("~/Github/FHRMK")

# -------------------------------------
#           INSTALL LIBRARY
# -------------------------------------

# Installing package
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("caret", quietly = TRUE)) {
  install.packages("caret")
}
if (!requireNamespace("leaps", quietly = TRUE)) {
  install.packages("leaps")
}
if (!requireNamespace("corrplot", quietly = TRUE)) {
  install.packages("corrplot")
}
if (!requireNamespace("tidyr", quietly = TRUE)) {
  install.packages("tidyr")
}
if (!requireNamespace("randomForest", quietly = TRUE)) {
  install.packages("randomForest")
}

library(corrplot)
library(readr)
library(caret)
library(leaps)
library(tidyr)
library(dplyr)
library(randomForest)

# -------------------------------------
#          UTIL FUNCTIONS
# -------------------------------------
createPicture <- function(picData, picName, picWidth = 1720, picHeight = 1720) {
  png(picName, width = picWidth, height = picHeight)
  corrplot(cor(picData),
           method = "color",
           tl.col = "black",
           tl.srt = 45,
           addCoef.col = "black")
  dev.off()
}

# -------------------------------------
#         LOAD DATA
# -------------------------------------

load("~/GitHub/FHRMK/RawData/easySHARE_rel9-0-0_R/easySHARE_rel9_0_0.rda")

# -------------------------------------
#         OMIT SOME COLUMNS
# -------------------------------------

# TODO

# -------------------------------------
#           DATA TYPE DIVIDER
# -------------------------------------

# Get the data types of each column
column_types <- sapply(easySHARE_rel9_0_0, class)

# Unique data types
unique_types <- unique(column_types)

# Automatically create a data frame for each data type
for (type in unique_types) {
  # Create a dynamic variable name for each data type
  df_type_name <- paste0("df_", gsub(" ", "_", type))  # Replace spaces with underscores
  # Subset the columns that match the current type and assign to the data frame
  assign(df_type_name, easySHARE_rel9_0_0[, column_types == type, drop = FALSE])
  # Optionally print the names of the created data frames
  print(paste("Data frame created for type:", df_type_name))
}

# Clean up unnecessary variables
rm(column_types, unique_types, type, df_type_name)

# -------------------------------------
#     TIDY UP CHARACTER / TEXT
# -------------------------------------

# Columns to omit
chr_omit <- c("merge_id", "hhid", "couple_id")

# Create df_character_2 by omitting the specified columns
df_character_2 <- df_character[, !(names(df_character) %in% chr_omit)]

# Convert character columns in df_character_2 to factors
df_character_3 <- data.frame(lapply(df_character_2, function(x) {
  if (is.character(x)) {
    as.numeric(factor(x))
  } else {
    x
  }
}), stringsAsFactors = FALSE)  # Use stringsAsFactors = FALSE to avoid unwanted behavior

# Optionally print the structure of the new data frame to verify the changes
str(df_character_3)

# Deleting Variable
rm(chr_omit)

# -------------------------------------
#         COMBINING DATAFRAME
# -------------------------------------

# Combining the Dataset (dataframe)
df_2 <- cbind(df_numeric_3, df_character_3)

createPicture(df_numeric, "myPic.png")




