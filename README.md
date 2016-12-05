*Immunome_ARC*
========
This readme contains information on how to analyze target enrichment data from
gopher tortoises using the [ARC assembly pipeline from iBest](http://ibest.github.io/ARC/).
The data come from sequence read archive accession number SRP061247 for the following paper 
[doi: 10.1111/1755-0998.12591)](http://dx.doi.org/10.1111/1755-0998.12591).

# 1. Install Software
1. Install ARC
```
    cd ~/bin/
    git clone git://github.com/ibest/ARC.git
```
2. Download BOWTIE 2
```
    cd ~/bin/
    wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.2.9%2F&ts=1480614131&use_mirror=pilotfiber
    mv bowtie2-2.2.9-linux-x86_64.zip\?r\=https\:%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.2.9%2F bowtie2-2.2.9.zip
    unzip bowtie2-2.2.9.zip
    # add bowtie2 to path
    nano ~/.soft
    # add the following line:
    PATH=$PATH:/home/jelber2/bin/bowtie2-2.2.9
    # exit and save with ctrl+X then Y
    # resource .soft
    resoft
```
3. Download SPAdes
```
    cd ~/bin/
    wget http://spades.bioinf.spbau.ru/release3.9.0/SPAdes-3.9.0-Linux.tar.gz
    tar xzf SPAdes-3.9.0-Linux.tar.gz
    mv SPAdes-3.9.0-Linux.tar.gz SPAdes-3.9.0-Linux/.
    # add SPAdes to path
    nano ~/.soft
    # add the following line:
    PATH=$PATH:/home/jelber2/bin/SPAdes-3.9.0-Linux/bin
    # exit and save with ctrl+X then Y
    # resoft
    resoft
```
4. Trimmomatic
5. BBMerge
6. BLAST

# 2. Get sequences, combine, and QC sequences
1. Get sequences from SRA (using SRA Run Selector)
`cd /work/jelber2/; mkdir immunome_arc immunome_arc/fastq; cd immunome_arc/fastq/; qsub ~/scripts/immunome_arc/get.sra.sh`
2. Rename sra sequences
`bash rename3.sra.sh`
3. Convert sra to fastq
`python ~/scripts/immunome_arc/get.fastq.py *.sra`
4. Concatenate read1 for each run and read2 for each run
`bash ~/scripts/immunome_arc/concatenate4.reads.sh`
5. Sequence QC
`cd /work/jelber2/immunome_arc/fastq/; python ~/scripts/immunome_arc/02-trimmomatic.py`
6. Combine all R1 and R2 and singlesANDmerged
`qsub combine4.unzip.fastq.sh`

# 3. Make immunome.reference.fa
1. Merge overlapping intervals
```cd /work/jelber2/reference/
~/bin/bedtools-2.26.0/bin/bedtools sort -i immunome_baits_C_picta-3.0.3.bed | \
~/bin/bedtools-2.26.0/bin/bedtools merge > immunome_baits_C_picta-3.0.3.merged.bed```
2. Get FASTA sequence
```~/bin/bedtools-2.26.0/bin/bedtools getfasta \
-fi C_picta-3.0.3.fa \
-bed immunome_baits_C_picta-3.0.3.merged.bed \
-fo immunome_baits_C_picta-3.0.3.merged.fa```
3. Run ARC
`qsub ~/scripts/immunome_arc/run.arc.sh`
