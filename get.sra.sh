#!/bin/bash
#
###############################################################################
#
# "get.sra.sh" SuperMikeII script 
# created by Jean P. Elbers
# jean.elbers@gmail.com
# last edited 1 December 2016
#
###############################################################################
#
#PBS -q single
#PBS -A hpc_sesp
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00
#PBS -o /work/jelber2/immunome_arc/fastq
#PBS -j oe
#PBS -N get.sra.sh

# Let's mark the time things get started with a date-time stamp.

date

# Set work directory

export WORK_DIR=/work/jelber2/immunome_arc/fastq

# gets desired SRA runs from SRR_Acc_List.txt (made with NCBI SRA Run Selector)

cd $WORK_DIR
while read i;do
~/bin/sratoolkit.2.8.0-centos_linux64/bin/prefetch $i
mv /home/jelber2/ncbi/public/sra/$i.sra $WORK_DIR
done < ~/scripts/immunome_arc/SRR_Acc_List.txt
