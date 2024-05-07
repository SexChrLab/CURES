# How data was generated

## Before running snakefiles
1) Created a conda environment that included all the software used for data processing
2) Configuration file [config_B1_labgenerated.json] contains list of all the samples to be processed and paths to the reference genome used for alignments (GRCh38.p12, sex complement)

## Order of snakefiles/scripts to generate data
1) Generate sequence files by trimming with different parameters [generate_trimming_data.snakefile]
2) FastQC analysis of untrimmed (raw) and trimmed sequence files [fastqc.snakefile]
3) Align to sex complement reference genomes [align.snakefile]
4) Quantitate gene expression by counting all the reads that align to each gene [feature_counts.snakefile]
5) Merge all quantitation files into one table for easier use [merge_counts_v2.py]
