import subprocess as sb
import os
import sys

def fix_bam_file(bam_filename,OUTPUT_FOLDER='./'):
    
    good_sq_lines=['@SQ	SN:chr1	LN:249250621',
    '@SQ	SN:chr2	LN:243199373',
    '@SQ	SN:chr3	LN:198022430',
    '@SQ	SN:chr4	LN:191154276',
    '@SQ	SN:chr5	LN:180915260',
    '@SQ	SN:chr6	LN:171115067',
    '@SQ	SN:chr7	LN:159138663',
    '@SQ	SN:chr8	LN:146364022',
    '@SQ	SN:chr9	LN:141213431',
    '@SQ	SN:chr10	LN:135534747',
    '@SQ	SN:chr11	LN:135006516',
    '@SQ	SN:chr12	LN:133851895',
    '@SQ	SN:chr13	LN:115169878',
    '@SQ	SN:chr14	LN:107349540',
    '@SQ	SN:chr15	LN:102531392',
    '@SQ	SN:chr16	LN:90354753',
    '@SQ	SN:chr17	LN:81195210',
    '@SQ	SN:chr18	LN:78077248',
    '@SQ	SN:chr19	LN:59128983',
    '@SQ	SN:chr20	LN:63025520',
    '@SQ	SN:chr21	LN:48129895',
    '@SQ	SN:chr22	LN:51304566',
    '@SQ	SN:chrX	LN:155270560',
    '@SQ	SN:chrM	LN:16571']
    
    reheader_file=bam_filename.replace('.bam','_fix_header.bam')
    final_file= os.path.join(OUTPUT_FOLDER,os.path.basename(reheader_file.replace('.bam','_no_mmap.bam')))
    header_file=bam_filename.replace('.bam','_newheader.sam')
    print 'Processing:%s' % bam_filename
    print reheader_file
    print final_file
    print header_file
    
    #extract the header
    header=sb.check_output('samtools view -H %s ' %bam_filename,shell=True).split('\n')

    #if there is an alternative assembly skip the file
    CUSTOM_ASSEMBLY=any([True  for x in header if  'UL:/' in x])
    
    if CUSTOM_ASSEMBLY:
        
        print 'PROBLEMATIC FILE WITH CUSTOM ASSEMBLY:%s' % bam_filename
        print header
        pass
        
    
    else:
        
        final_header=[]
        for line in header:
            if line.startswith('@SQ'):
                
                for reference_line in good_sq_lines:
                    if line.startswith(reference_line):
                        final_header.append(line)
                        print 'matched:%s %s' %(line,reference_line)
                    
            else:
                final_header.append(line)
    
        with open(header_file,'w+') as outfile:
            outfile.write('\n'.join(final_header))

        #otherwise replace header
        #!samtools reheader new_header.sam {bam_filename} > {reheader_file}
        cmd='samtools reheader %s %s > %s ' %(header_file,bam_filename,reheader_file)
        print cmd
        sb.call(cmd,shell=True)

        #filter multiple mapped reads
        #!samtools view -h -F 512  {reheader_file} | grep -E -v "XA:|XT:" | samtools view -b -S > {final_file}
        cmd='samtools view -h -F 512 %s |grep -E -v "XA:|XT:"| samtools view -b -S > %s' % (reheader_file,final_file)
        sb.call(cmd,shell=True)
        print cmd
        #delete intermediate
        #os.remove(reheader_file)
        #os.remove(header_file)
        #!rm new_header.sam
        #!rm {reheader_file}

fix_bam_file(sys.argv[2],sys.argv[1]) 
    
