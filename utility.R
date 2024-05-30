# Load necessary libraries
library(dplyr)

# Load the data from a TSV file
clinical_data <- read.table("clinical.tsv", header = TRUE, sep = "\t", fill = TRUE, quote = "")

# Remove columns 'treatment_type' and 'treatment_or_therapy'
# clinical_data <- select(clinical_data, -c(treatment_type, treatment_or_therapy))
clinical_data <- select(clinical_data, -c(primary_diagnosis, site_of_resection_or_biopsy, tissue_or_organ_of_origin, treatment_type, treatment_or_therapy))

# Remove duplicate rows, keeping only unique rows
clinical_data_unique <- distinct(clinical_data)

names(clinical_data_unique)[names(clinical_data_unique) == "case_submitter_id"] <- "Case_ID"

# You can write the unique data to a new file if needed
write.csv(clinical_data_unique, "clinical_unique.csv", row.names = FALSE)

# clinical_data_unique <- read.csv("clinical_unique.csv")

# Load the TSV file
gdc_sample_sheet <- read.delim("gdc_sample_sheet.2024-03-23.tsv")

names(gdc_sample_sheet)[names(gdc_sample_sheet) == "Case.ID"] <- "Case_ID"
names(gdc_sample_sheet)[names(gdc_sample_sheet) == "File.Name"] <- "File_Name"
names(gdc_sample_sheet)[names(gdc_sample_sheet) == "Sample.Type"] <- "Sample_Type"

# Perform an inner join based on the 'case_id' column
merged_data <- inner_join(gdc_sample_sheet, clinical_data_unique, by = "Case_ID")

# Write the merged data to a CSV file, ensuring NA values are written as empty cells
write.csv(merged_data, "ref4.csv", row.names = FALSE, quote = FALSE, na = "")

filenames <- as.data.frame(merged_data$File_Name)
colnames(filenames) <- "File_Name"

write.csv(filenames, "filenames.csv", row.names = FALSE)
