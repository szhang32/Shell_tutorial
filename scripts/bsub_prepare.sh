#!/bin/bash

while read library sample_id histone_mark genotype day
do
	#echo $sample_id
	if [[ "$sample_id" != "id" ]] 
	then
		#echo $sample_id
		R1="raw_fastq/${library}_R1.fastq.gz"
		R2="raw_fastq/${library}_R2.fastq.gz"	
		#echo "$R1"

		# create a bsub shell script for each sample
		outsh="$sample_id.sh"
		echo "#!/bin/sh" > $outsh
		echo "#BSUB -J ${sample_id}_alignment" >> $outsh
		echo "#BSUB -oo ${sample_id}_alignment.o" >> $outsh
		echo "#BSUB -eo ${sample_id}_alignment.e" >> $outsh
		echo "module load bowtie2/2.3.4.3" >> $outsh
		echo "cd .." >> $outsh
		echo "bowtie2 -x ref/ecoli -1 $R1 -2 $R2 -S $sample_id.sam" >> $outsh
	fi
done < ../sample_information.txt
