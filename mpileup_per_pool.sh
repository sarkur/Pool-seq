#!/bin/bash -l
#SBATCH -A snicXXXX
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10-00:00:00

### Some popgen calculations require mpileup with only one pair or one pool, depending on use. 
### Usage: Run the script for one population pair at a time. Fill out the following parameters and start the
script using "sbatch". If more than two populations are compared at the same time, adjust the code accordingly.
########## Modify the following parameters:
popA="A" # name of first population in the pair
popB="B" # name of second population in the pair
ref="reference.fasta" # path to reference assembly, including
reference assembly file name
refname="reference" # insert here a short and descriptive name for the reference genome that was used for
bam="/proj/dataset/bam_files" # path to directory with bam files. Replace "proj" and "dataset" accordingly
popoolation="/proj/dataset/popoolation" # path to directory with input and output files for analyses in popoolation and popoolation2. Replace "your_name" and "dataset" accordingly
##########
module load bioinfo-tools samtools/1.8
samtools mpileup -B -q 20 -Q 20 -f ${ref} ${bam}/${popA}_clean_bq20.${refname}_merged_paired.bam ${bam}/${popB}
_clean_bq20.${refname}_merged_paired.bam > ${popoolation}/${popA}_${popB}.${refname}.q20_Q20.mpileup