#!/bin/bash -l
#SBATCH -A snicXXX
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
########## Modify the following parameters:
refdir="/dir/" # enter correct path to reference genome (only the directory)
fasta="reference.fasta" # enter correct reference genome file name (fasta format)
##########
cd ${refdir}
module load bioinfo-tools samtools/1.8
samtools faidx ${fasta}