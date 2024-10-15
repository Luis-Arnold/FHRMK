# Load the RDA file
load("~/FHNW/SecondSemester/Research Methods/Project/Data/easySHARE_rel9-0-0_R/easySHARE_rel9_0_0.rda")

# Assuming the dataset is loaded into an object, inspect the object names
ls()

# Replace 'dataset_name' with the actual object name if needed
# First look at the structure of the dataset
str(easySHARE_rel9_0_0)

# Display the first few rows
head(easySHARE_rel9_0_0)

# Summary statistics for numerical columns
summary(easySHARE_rel9_0_0)

# Check for missing values
colSums(is.na(easySHARE_rel9_0_0))

# View column names
colnames(easySHARE_rel9_0_0)
