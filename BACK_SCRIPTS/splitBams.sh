#!bin/bash
###-----###
#ksivaprakasam
#script to add 1) split the BAMs 2)readgroup IDs using picardTools
#input files 
###---###

workdir=/hackathon/Hackathon_Project_4/ENCODE_DATA_GM12878/COMPLETED

cd $workdir

#separating the chromosome 22 bam alone and indexing it.i
mkdir ./chr22bams
x=`cat ./temp/rgIds.txt`
for i in $x; do
        y=`echo $i|cut -d':' -f1`
        z=`echo $i|cut -d':' -f2`
	chrFile=$y"_chr22.bam"
	echo $y
	samtools view $y".bam" chr22 -b > ./chr22bams/$chrFile
	samtools index ./chr22bams/$chrFile ./chr22bams/$chrFile".bai"
done



x=`cat ./temp/rgIds.txt`
for i in $x; do
        y=`echo $i|cut -d':' -f1`
        z=`echo $i|cut -d':' -f2`
       
	picard AddOrReplaceReadGroups I=$y"_chr22.bam" O=$y"_chr22_rg.bam" RGID=$i RGLB="lib1" RGPL=$z RGPU="unit1" RGSM="20"
        samtools index $y"_chr22_rg.bam" $y"_chr22_rg.bam.bai"
done
