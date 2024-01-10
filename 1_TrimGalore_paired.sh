#!/bin/bash

# create a new directory for output files
mkdir /Volumes/Expansion/Franz/FASTQ_trimmed

# directory
dir="/Volumes/Expansion/Franz/RNAseq\ IO\ LB\ PolyB/OIpolyBFZ-372447203/FASTQ_Generation_2022-11-15_00_07_20Z-629512886"
outdir="/Volumes/Expansion/Franz/FASTQ_trimmed"

# move to the directory containing FASTQ files
cd $dir

# declare an array variable
declare -a R1=(*_R1_001.fastq.gz)
declare -a R2=(*_R2_001.fastq.gz)

# length of the array
len=${#R1[@]}

# execute TrimGalore
for ((i=0; i<$len; i++)); do
trim_galore --cores 3 --paired --gzip -o "$outdir" "${R1[$i]}" "${R2[$i]}"
done
