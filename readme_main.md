# Project README

## Overview

This project aims to facilitate the analysis of raw data from GDC by providing scripts to download, process, and analyze the data. Follow the steps outlined below to set up and run the necessary scripts.

## Setup

### Step 1: Download Raw Data

1. Navigate to the `./testing/raw` subdirectory.
2. Execute the `download.sh` script, which uses the `uuid.tsv` file to download all required raw data into the `raw` folder:
   ```sh
   cd ./testing/raw
   ./download.sh
3. Once the download is complete, move the download.sh and uuid.tsv files out of the raw folder:
    ```sh
    mv download.sh ../
    mv uuid.tsv ../

### Step 2: Prepare Reference File
For testing, a ref4.csv file is provided. If you need to build it yourself, ensure it contains at least the following five columns:

- unique identifier: A unique identifier for each sample.
- Sample_Type: "Primary Tumor" or "Solid Tissue Normal".
- days_to_death: Contains a numeric value or is empty.
- vital_status: "Dead" or "Alive".
- days_to_last_follow_up: Contains a numeric value or is empty.

### Step 3: Manually Copy and Merge Files
1. Manually copy the files-table*.tsv files from GDC to get the UUID and filenames correlation.
2. Merge these files with either clinical.tsv or gdc_sample_sheet*.tsv.

### Step 4: Build Reference File (Optional)
If you plan on building the reference file (ref4.csv) yourself, use Utility.R. This script builds the ref4.csv file based on the GDC public data using clinical.tsv and gdc_sample_sheet*.tsv. Ensure that the filenames and UUIDs are correct and included in the file.

### Step 5: Prepare Testing Folder
In the testing folder, you should have:

- The reference file ref4.csv.
- A raw subfolder containing the beta value for each sample.

Run the script ./../run_pack.R, which includes detailed notes on each function:

    ```sh
    cd ./testing
    ../run_pack.R


### Step 6: Move Required Files
Before running the analysis_small.R script, move the necessary files into the testing folder. You will need either:

- e0_em_see.csv and m_vall_all.csv
or
- opt_em_see.csv and m_vall_all.csv

### Step 7: Run Analysis Script
Run the analysis_small.R script. This script is not part of the package but will be added later. It outputs notes.csv, which is the ref4.csv file with an additional column clusters that indicates the cluster each sample belongs to:

    ```sh
    ./analysis_small.R


## Notes
- Ensure all scripts are executed in the correct directories.
- Verify that all required files are present before running the scripts.
- Detailed notes and instructions are provided within each script for additional guidance.
