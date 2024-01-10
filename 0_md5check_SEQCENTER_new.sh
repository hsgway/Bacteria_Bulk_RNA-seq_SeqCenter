#!/bin/bash

# file and directory
dir="/Volumes/Expansion/Bacteria_RNAseq_reads/20230406_Ian_CR_anaerobe"

# go to the folder containing your files
cd $dir

# md5 check
md5sum *.fastq.gz
