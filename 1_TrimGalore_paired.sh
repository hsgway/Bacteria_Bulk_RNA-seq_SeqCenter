#!/bin/bash

# create a new directory for output files
mkdir /Volumes/Expansion/<your folder>/FASTQ_trimmed

# directory
dir="/Volumes/Expansion/<your FASTQ folder>"
outdir="/Volumes/Expansion/<your folder>/FASTQ_trimmed"

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
