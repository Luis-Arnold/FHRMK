# easySHARE_rel9_0_0

# Assuming 'easyshare' is the data frame containing the data
# and 'birth_country' is the variable for the ISO country code of birth

# List of ISO country codes for European countries (simplified example)
european_iso_codes <- c("AT", "BE", "BG", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", 
                        "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", 
                        "PT", "RO", "SK", "SI", "ES", "SE", "CH", "GB", "IS", "NO")

# Filter valid data (non-missing birth_country)
valid_data <- easySHARE_rel9_0_0[!is.na(easySHARE_rel9_0_0$birth_country), ]

head(valid_data)

# Count how many people were born outside of Europe
born_outside_europe <- sum(!(valid_data$birth_country %in% european_iso_codes))

# Total number of valid respondents
total_respondents <- nrow(valid_data)

# Calculate the percentage
percentage_born_outside_europe <- (born_outside_europe / total_respondents) * 100

# Print the result
#cat("Percentage of respondents born outside Europe:", round(percentage_born_outside_europe, 2), "%\n")

# Check the unique values of birth_country to see how the country codes are represented
unique(valid_data$birth_country)

# Trim any leading/trailing spaces in birth_country and country_mod (just in case)
valid_data$birth_country <- trimws(valid_data$birth_country)
valid_data$country_mod <- trimws(valid_data$country_mod)

# List of ISO country codes for European countries (simplified example)
european_iso_codes <- c("AT", "BE", "BG", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", 
                        "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", 
                        "PT", "RO", "SK", "SI", "ES", "SE", "CH", "GB", "IS", "NO")

# Check if the country codes match with European country codes
valid_data$born_in_europe <- valid_data$birth_country %in% european_iso_codes

# Count how many people were born outside of Europe
born_outside_europe <- sum(!valid_data$born_in_europe)

# Total number of valid respondents
total_respondents <- nrow(valid_data)

# Calculate the percentage
percentage_born_outside_europe <- (born_outside_europe / total_respondents) * 100

# Print the result
cat("Percentage of respondents born outside Europe:", round(percentage_born_outside_europe, 2), "%\n")
