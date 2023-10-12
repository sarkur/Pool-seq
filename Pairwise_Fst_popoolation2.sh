#!/bin/bash -l
#SBATCH -A 
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2-00:00:00
### Usage: Move to the directory containing sync files from which Fst should be calculated, fill out the parameters below, and loop through the sync files to start the script (file name extension is removed with sed command in the for loop):
# for i in $(ls *.sync | sed 's/.sync//g'); do sbatch ../scripts/pairwise_fst.sh $i; done
########## Modify the following parameters:
mincount="3" # number of reads per allele to be counted as a SNP
winsize="500" # sliding window size in bp
stepsize="500" # step size of the sliding window in bp. If the same size is chosen, the windows are nonoverlapping
mincov="25" # minimum coverage used for SNP identification. Calculated from coverage histograms of the
populations: average of 0.5*mode per population
maxcov="75,73" # maximum coverage used for SNP identification, per population. Calculated from coverage histograms of the populations: mode of histogram (per population) + 0.5 * mode of histogram (per population)
poolsize="100" # number of chromosomes per pool
##########
module load bioinfo-tools popoolation2/1201
perl /sw/apps/bioinfo/popoolation2/1201/rackham/fst-sliding.pl --input ${1}.sync --output ${1}.fst.txt --
suppress-noninformative --min-covered-fraction 0.0 --min-count ${mincount} --window-size