import glob
import os
import subprocess as sb

for bam_filename in glob.glob('*.bam'):
	if os.path.exists(bam_filename+'.bai'):
		pass
	else:
		print bam_filename
		sb.call('samtools index %s' % bam_filename,shell=True)
