#!/bin/bash
#
###############################################################################
#
# "combine2.unzip.fastq.sh" SuperMikeII script 
# created by Jean P. Elbers
# jean.elbers@gmail.com
# last edited 2 December 2016
#
###############################################################################
#
#PBS -q single
#PBS -A hpc_sesp
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00
#PBS -o /work/jelber2/immunome_arc/arc
#PBS -j oe
#PBS -N combine2.unzip.fastq.sh

# Let's mark the time things get started with a date-time stamp.

date

# Set work directory

export WORK_DIR=/work/jelber2/immunome_arc/trimmed-data

# combine all unmerged R1 and R2 and singlesANDmerged then gunzip

cd $WORK_DIR

cat FL846-R1-unmerged.trim.fastq.gz \
FL855-R1-unmerged.trim.fastq.gz \
FL857-R1-unmerged.trim.fastq.gz \
FL880-R1-unmerged.trim.fastq.gz \
GG1044-R1-unmerged.trim.fastq.gz \
GG1435-R1-unmerged.trim.fastq.gz \
GG1835-R1-unmerged.trim.fastq.gz \
GG462-R1-unmerged.trim.fastq.gz \
LA62-R1-unmerged.trim.fastq.gz \
LA66-R1-unmerged.trim.fastq.gz \
LA77-R1-unmerged.trim.fastq.gz \
LA78-R1-unmerged.trim.fastq.gz \
SD102-R1-unmerged.trim.fastq.gz \
SD103-R1-unmerged.trim.fastq.gz \
SD106-R1-unmerged.trim.fastq.gz \
SD108-R1-unmerged.trim.fastq.gz > ../arc/ALL-R1-unmerged.trim.fastq.gz
gunzip ../arc/ALL-R1-unmerged.trim.fastq.gz

cat FL846-R2-unmerged.trim.fastq.gz \
FL855-R2-unmerged.trim.fastq.gz \
FL857-R2-unmerged.trim.fastq.gz \
FL880-R2-unmerged.trim.fastq.gz \
GG1044-R2-unmerged.trim.fastq.gz \
GG1435-R2-unmerged.trim.fastq.gz \
GG1835-R2-unmerged.trim.fastq.gz \
GG462-R2-unmerged.trim.fastq.gz \
LA62-R2-unmerged.trim.fastq.gz \
LA66-R2-unmerged.trim.fastq.gz \
LA77-R2-unmerged.trim.fastq.gz \
LA78-R2-unmerged.trim.fastq.gz \
SD102-R2-unmerged.trim.fastq.gz \
SD103-R2-unmerged.trim.fastq.gz \
SD106-R2-unmerged.trim.fastq.gz \
SD108-R2-unmerged.trim.fastq.gz > ../arc/ALL-R2-unmerged.trim.fastq.gz
gunzip ../arc/ALL-R2-unmerged.trim.fastq.gz

cat FL846-singlesANDmerged.trim.fastq.gz \
FL855-singlesANDmerged.trim.fastq.gz \
FL857-singlesANDmerged.trim.fastq.gz \
FL880-singlesANDmerged.trim.fastq.gz \
GG1044-singlesANDmerged.trim.fastq.gz \
GG1435-singlesANDmerged.trim.fastq.gz \
GG1835-singlesANDmerged.trim.fastq.gz \
GG462-singlesANDmerged.trim.fastq.gz \
LA62-singlesANDmerged.trim.fastq.gz \
LA66-singlesANDmerged.trim.fastq.gz \
LA77-singlesANDmerged.trim.fastq.gz \
LA78-singlesANDmerged.trim.fastq.gz \
SD102-singlesANDmerged.trim.fastq.gz \
SD103-singlesANDmerged.trim.fastq.gz \
SD106-singlesANDmerged.trim.fastq.gz \
SD108-singlesANDmerged.trim.fastq.gz > ../arc/ALL-singlesANDmerged.trim.fastq.gz
gunzip ../arc/ALL-singlesANDmerged.trim.fastq.gz
