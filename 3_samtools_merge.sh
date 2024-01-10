#!/bin/bash

# directory
dir="/Volumes/Expansion/Franz/MappingResults/BAM_sorted"
outdir="/Volumes/Expansion/Franz/MappingResults/BAM_merge"

mkdir $outdir

# change directory
cd $dir

# merge bam files
declare -a filename=(*)
IFS=" " read -r -a samples <<< "$(echo "${filename[@]//_L[0-9]*/}" | tr ' ' '\n' | sort -u | tr '\n' ' ')"

for name in ${samples[@]}
do
  declare -a input=($name*)
  output=$(echo ${input[0]} | sed 's/_S[0-9]*_L[0-9]*.bam/.bam/')
  samtools merge "$outdir"/"$output" "$dir"/"${input[0]}" "$dir"/"${input[1]}" "$dir"/"${input[2]}" "$dir"/"${input[3]}"
  samtools index "$outdir"/"$output"
done
