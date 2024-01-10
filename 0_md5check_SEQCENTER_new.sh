#!/bin/bash

# file and directory
dir="/Volumes/Expansion/Bacteria_RNAseq_reads/<your_FASTQ_folder>"

# go to the folder containing your files
cd $dir

# md5 check
md5sum *.fastq.gz
