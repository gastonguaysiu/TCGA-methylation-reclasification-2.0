Go to the ./testing/raw subdirectory, the download.sh script will use the uui.tsv to download all the raw data you need into the folder. once download move download.sh and uuid,tsv out of the raw folder.

For testing I provided the ref4.csv file. otherwise you will need to build it your self. It must contain at least five columns:
    => a unique identifier for each sample
    Sample_Type => "Primary Tumor" or "Solid Tissue Normal"
    days_to_death => contains a numeric value cell is empty
    vital_status => "Dead" or "Alive"
    days_to_last_follow_up => contains a numeric value cell is empty


Manully copy the files-table*.tsv files from GDC to get the UUID and filenames correlation, merge it with either clinical.tsv or gdc_sample_sheet*.tsv.

Utility.R was use to build the ref4.csv file base on the GDC public data using the clinical.tsv and gdc_sample_sheet*.tsv. If you plan on building the reference file yourself you may want to double check that the filenames and UUID are all correct and in the file

From here in you testing folder you should have the reference file "ref4.csv" and a raw subfolder containing the beta value for each sample. Run the script ./../run_pack.R within the script will also contain detailled notes on each function.

finally you will need to move either the e0 em_see.csv + m_vall_all.csv or the opt em_see.csv + m_vall_all.csv files into the testing folder before runing the analysis_small.R script. That one is not part of the package (probably will add it myself later). The script will output notes.csv which is the ref4.csv file with the additional column clusters, which tells you which cluster each samples find itself in.

