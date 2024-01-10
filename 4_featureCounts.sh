#!/bin/bash

# directory
outdir="/Volumes/Expansion/<your folder>"
mkdir $outdir

# gff3
gff3="/Volumes/Expansion/Bacteria_RNAseq_references/xxxxx.gff"

# go to the folder containing sorted BAM files
cd /Volumes/Expansion/<your folder>/MappingResults/BAM_sorted

# array and variable
declare -a bam=(*.bam)

# featureCounts
featureCounts -T 6 -s 2 -p -B -C -F GTF -t gene,pseudogene -g locus_tag -a $gff3 -o $outdir/all.txt ${bam[@]}
