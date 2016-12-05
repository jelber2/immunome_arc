#! /usr/bin/env python

# PBS cluster job submission in Python
# Trimmomatic for quality and adapter trimming
# By Jean P. Elbers
# jean.elbers@gmail.com
# Last modified 1 Dec 2016
###############################################################################
Usage = """

get.fastq.py - version 1.0

Command:
1.Uses fastqdump to convert sra to fastq.gz

Directory info:
InDir = /work/jelber2/immunome_arc/fastq/
Input Files = Sample.sra
Output Files = Sample_R1.fastq.gz
               Sample_R2.fastq.gz

Usage (execute following code in InDir):

~/scripts/immunome_arc/get.fastq.py *.sra

"""
###############################################################################
import os, sys, subprocess, re #imports os, sys, subprocess, re modules


if len(sys.argv)<2:
    print Usage
else:
    FileList = sys.argv[1:]
    InDir = "/work/jelber2/immunome_arc/fastq/"
    for InFileName in FileList:
        FileSuffix = ".sra" # string to remove from InFileName
        Sample = InFileName.replace(FileSuffix,'') # creates Sample string
        # Customize your options here
        Queue = "single"
        Allocation = "hpc_sesp"
        Processors = "nodes=1:ppn=1"
        WallTime = "00:15:00"
        LogOut = InDir
        LogMerge = "oe"
        JobName = "fastqdump-%s" % (Sample)
        Command = """
        ~/bin/sratoolkit.2.8.0-centos_linux64/bin/fastq-dump -I --split-files --gzip %s.sra""" % (Sample)

        JobString = """
        #!/bin/bash
        #PBS -q %s
        #PBS -A %s
        #PBS -l %s
        #PBS -l walltime=%s
        #PBS -o %s
        #PBS -j %s
        #PBS -N %s

        cd %s
        %s\n""" % (Queue, Allocation, Processors, WallTime, LogOut, LogMerge, JobName, InDir, Command)

        #Create pipe to qsub
        proc = subprocess.Popen(['qsub'], shell=True,
          stdin=subprocess.PIPE, stdout=subprocess.PIPE, close_fds=True)
        (child_stdout, child_stdin) = (proc.stdout, proc.stdin)

        #Print JobString
        jobname = proc.communicate(JobString)[0]
        print JobString
        print jobname
