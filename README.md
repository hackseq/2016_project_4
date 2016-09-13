# Pseudo-WGS variant calling for common cell types aggregating ChIP-seq, RNA-seq and DHS from ENCODE and Roadmap Epigenomics data

Motivation
----------
Recent progress in sequencing technologies have led to a massive production of epigenetic datasets for many cell lines, thanks mainly to big consortia like ENCODE. This resource has helped tremendously to understand the role of non-coding variants and to prioritize the search of putative causal SNPs through cell-type-specific functional regions such as active or repressed promoters, enhancers, insulators, repressed or open chromatin. On the other hand we still miss genotype information for almost all the cell types profiled limiting the power of allele specific alignments and further analysis that require the right reference genome. 

Goals
-----
To fill this gap the goal of this project is to recover genotype information such as SNPs for common cell types aggregating ChIP-seq, RNA-seq, DHS and other sequencing data already produced and available from the ENCODE and the Roadmap Epigenomics consortia. The basic idea is that although single assays for each cell line don't have enough coverage in many regions of the genome, aggregating sequencing information for all the available assays for each cell type provides enough power to recover variants with high confidence. Given the limited amount of time we can establish the performances of the proposed pipeline analyzing one common cell line (for example GM12878) for which WGS data is already available. If we have time we can also create a simple web app to let people explore any region for SNPs of interest. If this initial phase is successful the long term vision will be to provide .VCF files for many cell types ready to use for the community, mining already available and public data.


Suggested readings
------------------
Mielczarek M, Szyda J. Review of alignment and SNP calling algorithms for next-generation sequencing data. J Appl Genet. 2016 Feb;57(1):71-9. doi: 10.1007/s13353-015-0292-7. Epub 2015 Jun 9. Review. PubMed PMID: 26055432. (http://www.ncbi.nlm.nih.gov/pubmed/26055432)
