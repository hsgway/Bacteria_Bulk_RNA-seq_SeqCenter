#!/bin/bash

# directory
outdir="/Volumes/Expansion/test"
mkdir $outdir

# gff3
gff3="/Volumes/Expansion/Bacteria_RNAseq_references/Cr_genome/GCF_000027085.1_ASM2708v1_genomic.gff"

# go to the folder containing sorted BAM files
cd /Volumes/Expansion/Ian/20230511_CR_RNAseq_fecal_anaerobe/MappingResults/BAM_sorted

# array and variable
declare -a bam=(*.bam)

# featureCounts
featureCounts -T 6 -s 2 -p -B -C -F GTF -t gene,pseudogene -g locus_tag -a $gff3 -o $outdir/all.txt ${bam[@]}
