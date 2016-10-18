#!/bin/bash

workdir=/hackathon/Hackathon_Project_4/ENCODE_DATA_GM12878/COMPLETED

cd $workdir

x=`cat ./temp/rgIds.txt`
for i in $x; do
        y=`echo $i|cut -d':' -f1`
        z=`echo $i|cut -d':' -f2`
	echo $y	
	sh picardTools.sh $y $z        
done
