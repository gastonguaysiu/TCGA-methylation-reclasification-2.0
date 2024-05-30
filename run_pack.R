library(devtools)
devtools::install("/home/gaston/mun/kirp/kirp_pack/my_test/methml")
devtools::load_all("/home/gaston/mun/kirp/kirp_pack/my_test/methml")

setwd("/home/gaston/mun/kirp/kirp_pack/my_test/methml/R") # Change to the package directory
library(methml)

library(tidyverse)
library(readr)
library(dplyr)
library(tidyr)


?process_raw
?create_e0
?ml1
?organize_directories
?build_ei
?opt_ml


# Define the main directory and output directory
main_dir <- "/home/gaston/mun/kirp/kirp_pack/my_test/testing"
output_dir <- main_dir  # Output directory is set to main directory

# here you are building the m_value table and csv that lists all the CpG probes
# that are going to be used in the e0 step 

process_raw(main_dir = main_dir, output_dir = output_dir)
create_e0(main_dir = main_dir)


# here is the long step of creating the multiple intances of convergent probe lists
# you can minimize the updated comments by increasing the update_time
# for testing purposes I kept this samll, I may add additional setting to function
# later

# source("/home/gaston/mun/kirp/kirp_pack/my_test/methml/R/ml1.R")
# Define the parameters for the function
m_val_file <- "m_val_all.csv"  # Name of your m values CSV file
em_see_outpath <- "em_see.csv"  # Output path for the em_see values CSV
ref_file <- "ref4.csv"  # Name of your reference values CSV file
update_time <- 600

num_conv <- 3
em_stop <- 100

ml1(main_dir = main_dir, m_val_file = m_val_file, em_see_outpath= em_see_outpath, ref_file = ref_file,
    num_conv = num_conv, em_stop = em_stop, update_time = update_time)


# organize the directories

# source("/home/gaston/mun/kirp/kirp_pack/my_test/methml/R/organize_directories.R")
sub_dir_name <- "all_conv0-3"
e0_dir = "e0"

organize_directories(main_dir = main_dir, sub_dir_name = sub_dir_name, e0_dir = e0_dir)


# build a probes list that will be used for the optimized run
# it uses all the probes from previous convergences

# source("/home/gaston/mun/kirp/kirp_pack/my_test/methml/R/build_ei.R")
sub_dir_name <- "all_conv0-3"
target_file_name <- "em_see.csv"
temp_dir <- "temp"

build_ei(main_dir = main_dir, sub_dir_name = sub_dir_name,
                         target_file_name = target_file_name, temp_dir = temp_dir)


# final run for the optimized list of probes

# source("/home/gaston/mun/kirp/kirp_pack/my_test/methml/R/opt_ml.R")
# main_dir <- "/home/gaston/mun/kirp/kirp_pack/my_test/testing"
m_val_file <- "m_val_all.csv"  # Name of your m values CSV file
em_see_outpath <- "em_see.csv"  # Output path for the em_see values CSV
sub_dir_name <- "all_conv0-3"
ref_file <- "ref4.csv"  # Name of your reference values CSV file
em_stop <- 100

update_time <- 600

opt_ml(main_dir = main_dir, m_val_file = m_val_file, em_see_outpath = em_see_outpath,
       sub_dir_name = sub_dir_name, ref_file = ref_file,
       em_stop = em_stop, update_time = update_time)


