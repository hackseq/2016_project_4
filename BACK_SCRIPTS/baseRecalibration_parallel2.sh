#!/bin/bash

# Script to perform indel re-alignment, base qual recalib on the bam file
# Shobana Sekar, Hackseq2016, 10/15/2016
# Modified to add option -allowPotentiallyMisencodedQuals

KNOWN_SITES=/hackathon/Hackathon_Project_4/DBSNP/dbsnp_138_ENCODE3.hg19.vcf.gz
REFERENCE_FASTA=/hackathon/Hackathon_Project_4/REFERENCE_GENOME/hg19_ENCODE.fa
bam=$1
	
filename=`echo ${bam} | awk -F'.' '{print $1}'`
echo $filename
# echo "Extracting chromosome 22 for ${filename}.."
# samtools view -b ${bam} chr22 > ${filename}_chr22.bam
# samtools index ${filename}_chr22.bam
# Add read group
# picardtools AddOrReplaceReadGroups I=input.bam O=output.bam RGID=4 RGLB=lib1 RGPL=illumina RGPU=unit1

# Print reads
echo "Re-assigning mapping quality scores.."
gatk -T PrintReads -R ${REFERENCE_FASTA} -I ${bam} -o ${filename}_reassigned.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 --defaultBaseQualities 60 -U ALLOW_N_CIGAR_READS -allowPotentiallyMisencodedQuals 	
# Base quality score recalibration
echo "Generating calibration table.."
gatk -T BaseRecalibrator -R ${REFERENCE_FASTA} -I ${filename}_reassigned.bam -knownSites ${KNOWN_SITES} -o ${filename}_reassigned_recal_data.table -U ALLOW_N_CIGAR_READS -allowPotentiallyMisencodedQuals

# Print reads 
echo "Generating re-calibrated bam.."
gatk  -T PrintReads -R ${REFERENCE_FASTA} -I ${filename}_reassigned.bam -BQSR ${filename}_reassigned_recal_data.table -o ${filename}_recalibrated.bam -U ALLOW_N_CIGAR_READS -allowPotentiallyMisencodedQuals
