#!/bin/bash

y=`echo $1|cut -d':' -f1`
z=`echo $1|cut -d':' -f2`
echo $y

picard AddOrReplaceReadGroups I=$PWD/chr22bams/$y"_chr22.bam" \
	O=$PWD/rg_bams/$y"_chr22_"$z"_rg.bam" \
	RGID=$y":"$z \
	RGLB=lib1 \
	RGPL=illumina \
	RGPU=unit1 \
	RGSM=20 \
	VALIDATION_STRINGENCY=LENIENT
samtools index $PWD/rg_bams/$y"_chr22_"$z"_rg.bam" $PWD/rg_bams/$y"_chr22_"$z"_rg.bam.bai"

