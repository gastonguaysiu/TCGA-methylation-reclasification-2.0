#!/bin/bash

mapfile -t uuid < ./uuid.csv

for i in "${uuid[@]}"
do
echo "downloading $i"
curl --remote-name --remote-header-name https://api.gdc.cancer.gov/data/$i
done
