#!/bin/sh
#BSUB -J main
#BSUB -oo main.o
#BSUB -eo main.e
#BSUB -B
#BSUB -N
#BSUB -u Shuo.Zhang@Pennmedicine.upenn.edu
#BSUB -M 10000
#BSUB -W 30:00

# load modules
module add sratoolkit/3.0.0
module add bowtie2/2.3.4.3

# change to target working directory
cd /home/szhang32/project1

# download raw fastq files
fastq-dump --gzip --split-files SRR8383505

# download E.coli reference genome
mkdir ref
cd ref
wget https://www.ebi.ac.uk/ena/browser/api/fasta/U00096.3?download=true -O ecoli.fa

# index E.coli reference genome
bowtie2-build ecoli.fa ecoli

# align reads to E.coli reference genome
cd ..
bowtie2 -q --local --very-sensitive --no-mixed --no-unal --dovetail --phred33 -x ref/ecoli -1 SRR8383505_1.fastq.gz -2 SRR8383505_2.fastq.gz -S Ecoli.sam

rm SRR8383505_1.fastq.gz SRR8383505_2.fastq.gz
