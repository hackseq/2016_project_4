#!/bin/bash

workdir=/hackathon/Hackathon_Project_4/ENCODE_DATA_GM12878/COMPLETED

cd $workdir

x=`cat ./temp/rgIds.txt|head -n 5`
for i in $x; do
	startTime=`date+ %s`
        y=`echo $i|cut -d':' -f1`
        z=`echo $i|cut -d':' -f2`
	echo $y	
#	sh picardTools.sh $y $z        
	picard AddOrReplaceReadGroups I=$workdir/chr22bams/$y"_chr22.bam" O=$workdir/rg_bams/$y"_chr22_"$assay"_rg.bam" RGID=$i RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=20
	samtools index $workdir/rg_bams/$y"_chr22_"$assay"_rg.bam" $workdir/rg_bams/$y"_chr22_"$assay"_rg.bam.bai"
	endTime=`date +%s`
        runTime=$((endTime-startTime))
	echo $runTime
done
