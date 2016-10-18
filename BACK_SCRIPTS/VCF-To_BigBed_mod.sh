#!/bin/bash

#Jill Moore
#October 2016
#hackseq 2016 - Group 4

#Script to convert vcf file into bigBed format to be viewed on browser
#Usage: ./VCF-To-BigBed.sh file.vcf output

BASE_PATH=/hackathon/Hackathon_Project_4

vcf=$1
output=$2

python $BASE_PATH/SOFTWARE/Benchmark-Tools/vcf-to-bed.py $vcf bigBed > $output.bed

$BASE_PATH/SOFTWARE/bedToBigBed -type=bed6+1 $output.bed $BASE_PATH/GENOME_ANNOTATIONS/ChromInfo.txt $output.bb
