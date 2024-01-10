#!/bin/bash

#####
# before run this code
# please download fasta file of the genome
# and gff (or gtf) file for the later analysis
# and save it to the "Bacteria_RNAseq_references" folder in the External Hard Drive
# (in the folder whose name is your bacterial strain)
#####

# directory and file paths
dir="/Volumes/Expansion/Bacteria_RNAseq_bowtie2_index/Cr_index" # folder to put index files
fasta="/Volumes/Expansion/Bacteria_RNAseq_references/Cr/GCF_000027085.1_ASM2708v1_genomic.fna" # genome fasta file
indexname="Cr_ASM2708v1"

# create a folder to save the index for bowtie2
mkdir $dir

# go to the folder to save the index for bowtie2
cd $dir

# create a bowtie2 index
bowtie2-build $fasta $indexname
