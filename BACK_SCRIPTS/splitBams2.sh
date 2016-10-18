#!bin/bash
#########------------###########
#KSivaprakasam
#splits the chromosome 22 
#cat rgIds.txt|parallel --gnu -j32 -k sh splitBams2.sh
#########-----------###########

y=`echo $1|cut -d':' -f1`
z=`echo $1|cut -d':' -f2`
echo $y

chrFile=$y"_chr22.bam"
samtools view $y".bam" chr22 -b > ./chr22bams/$chrFile
samtools index ./chr22bams/$chrFile ./chr22bams/$chrFile".bai"
