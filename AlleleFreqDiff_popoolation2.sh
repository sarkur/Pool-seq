#!/bin/bash -l
#SBATCH -A 
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2-00:00:00
### Usage: Move to the directory containing sync files from which allele frequency differences should be calculated, fill out the parameters below, and loop through the sync files to start the script (file name extension is removed with sed command in the for loop):
# for i in $(ls *.sync | sed 's/.sync//g'); do sbatch ../scripts/af_diff.sh $i; done
########## Modify the following parameters:
mincount="3" # number of reads per allele to be counted as a SNP
mincov="25" # minimum coverage used for SNP identification. Calculated from coverage histograms of the populations: average of 0.5*mode per population
maxcov="75,73" # maximum coverage used for SNP identification, per population. Calculated from coverage histograms of the populations: mode of histogram (per population) + 0.5 * mode of histogram (per population)
##########
module load bioinfo-tools popoolation2/1201
perl /sw/apps/bioinfo/popoolation2/1201/rackham/snp-frequency-diff.pl --input ${1}.sync --output-prefix ${1} --
min-count ${mincount} --min-coverage ${mincov} --max-coverage ${maxcov}