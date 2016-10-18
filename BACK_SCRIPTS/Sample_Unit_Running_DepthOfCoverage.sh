BASE_PATH='/hackathon/Hackathon_Project_4/'

#INDEXED_RG_BAMPATHS="/hackathon/Hackathon_Project_4/ENCODE_DATA_GM12878/COMPLETED/*_rg*bai" # TODO: change this to bam when everything is indexed
#REFERENCE="/hackathon/Hackathon_Project_4/REFERENCE_GENOME/hg19_ENCODE.fa"
#GENEFILE="/hackathon/Hackathon_Project_4/REFERENCE_GENOME/refGene_"$CHROMOSOME"_sorted.txt"
#OUTPUT_DIRECTORY="/hackathon/Hackathon_Project_4/ENCODE_DATA_GM12878/COMPLETED/DepthOfCoverage"

REFERENCE=$BASE_PATH"REFERENCE_GENOME/hg19_ENCODE.fa"
GENEFILE=$BASE_PATH"REFERENCE_GENOME/refGene_"$CHROMOSOME"_sorted.txt"

BAM_PATHS=$BASE_PATH"ENCODE_DATA_GM12878/COMPLETED/rg_bams/"

BAM=$(ls $BAM_PATHS | egrep '*_rg.bam.bai' | egrep -v 'ENCFF000N*')

BAM_LIST=(${BAM// / })		
		
# 1. Parsing SAMPLE name	
for idx in ${!BAM_LIST[@]};	
do	

	#SAMPLE=${BAM_LIST[idx]%%_rg.bam.bai}
	SAMPLE=${BAM_LIST[idx]}
	SAMPLE_LIST="$SAMPLE_LIST $SAMPLE"

	echo ${BAM_LIST[idx]}

done

# 2. Calculate depth of coverage
DataList=(${SAMPLE_LIST// / })
for idx in ${!DataList[@]};
do
	SAMPLE=${DataList[idx]}
	#echo ${SAMPLE}'_depth'
	CMD=./depthOfCoverage_parallele.sh' '$SAMPLE
	$CMD
done
