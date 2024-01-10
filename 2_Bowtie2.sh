#!/bin/bash

# directory
dir="/Volumes/Expansion/<your folder>/FASTQ_trimmed"
outsamdir="/Volumes/Expansion/<your folder>/MappingResults/SAM"
outbamdir="/Volumes/Expansion/<your folder>/MappingResults/BAM"
outbamsorteddir="/Volumes/Expansion/<your folder>/MappingResults/BAM_sorted"
indexdir="/Volumes/Expansion/Bacteria_RNAseq_bowtie2_index/<your index folder>/<your index name>"

mkdir /Volumes/Expansion/<your folder>/MappingResults
mkdir $outsamdir
mkdir $outbamdir
mkdir $outbamsorteddir

# go to FASTQ_trimmed directory
cd "$dir"

# declare an array variable
declare -a R1=(*_R1_001_val_1.fq.gz)
declare -a R2=(*_R2_001_val_2.fq.gz)
declare -a input=($(echo "${R1[@]}" | sed "s/_R1_001_val_1.fq.gz//g"))

len=${#R1[@]}

# mapping
for ((i=0; i<$len; i++))
do
  output_sam=`echo ${R1[$i]} | sed -e 's/_R1_001_val_1.fq.gz/\.sam/'`
  output_bam=`echo ${R1[$i]} | sed -e 's/_R1_001_val_1.fq.gz/\.bam/'`
  bowtie2 --sensitive -p 3 -x "$indexdir" -1 "${R1[$i]}" -2 "${R2[$i]}" -S "$outsamdir"/"$output_sam"
  samtools view -bS "$outsamdir"/$output_sam -o "$outbamdir"/"$output_bam"
  samtools sort "$outbamdir"/"$output_bam" -o "$outbamsorteddir"/"$output_bam"
done
