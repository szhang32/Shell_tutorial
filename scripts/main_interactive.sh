#!/bin/bash
cd ..
module add bowtie2/2.3.4.3
bowtie2 -x ref/ecoli -1 raw_fastq/SRR8383505_1M_R1.fastq.gz -2 raw_fastq/SRR8383505_1M_R2.fastq.gz -S ecoli_alignment
