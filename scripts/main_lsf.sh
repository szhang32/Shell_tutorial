#!/bin/bash
#BSUB -J main_lsf
#BSUB -oo main_lsf.o
#BSUB -eo main_lsf.e
#BSUB -M 2000

cd ..
module add bowtie2/2.3.4.3
bowtie2 -x ref/ecoli -1 raw_fastq/SRR8383505_1M_R1.fastq.gz -2 raw_fastq/SRR8383505_1M_R2.fastq.gz -S ecoli_alignment
