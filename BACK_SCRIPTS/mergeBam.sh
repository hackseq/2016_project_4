bamOut=/hackathon/Hackathon_Project_4/VariantCall_HAPLOTYPE/merged_rg.chr22.bam
ls /hackathon/Hackathon_Project_4/VariantCall_HAPLOTYPE/*_rg.bam > /hackathon/Hackathon_Project_4/VariantCall_HAPLOTYPE/bamList.chr22.txt
samtools merge -r -b /hackathon/Hackathon_Project_4/VariantCall_HAPLOTYPE/bamList.chr22.txt $bamOut