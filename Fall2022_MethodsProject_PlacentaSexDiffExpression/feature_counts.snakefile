import os

configfile: "/data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/config_B1_labgenerated.json"

# Tool paths:
bbduksh_path = "bbduk.sh"
perllib_path = "PERL5LIB=/packages/6x/vcftools/0.1.12b/lib/per15/site_perl/"
adapter_path = "/data/CEM/shared/public_data/references/adapters/illumina_adapter.fa"
bwa_path = "bwa"
samtools_path = "samtools"
bbduksh_path = "bbduk.sh"
hisat_path = "hisat2"
bamtools_path = "bamtools"
picard_path = "picard"
featureCounts_path = "featureCounts"
annotation_path = "/data/CEM/shared/public_data/references/GENCODE/gencode.v29.annotation.gtf" 

rule all:
    input:
        expand("trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.geneCounts_XX.txt", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.geneCounts_XY.txt", sample_name = config["males"]),
        expand("trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.transcriptCounts_XX.txt", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.transcriptCounts_XY.txt", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.geneCounts_XX.txt", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.geneCounts_XY.txt", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.transcriptCounts_XX.txt", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.transcriptCounts_XY.txt", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"])

#============================================================================================  
# calculate counts from processed alignments for untrimmed data
#============================================================================================  

rule featureCounts_gene_females_untrimmed:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.geneCounts_XX.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g gene_name -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_gene_males_untrimmed:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.geneCounts_XY.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g gene_name -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_transcript_females_untrimmed:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.transcriptCounts_XX.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g transcript_id -O -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_transcript_males_untrimmed:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_NONE_minlen_NONE/featureCounts/{sample_name}_untrimmed.transcriptCounts_XY.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g transcript_id -O -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        

#============================================================================================  
# calculate counts from processed alignments for trimmed data
#============================================================================================  

rule featureCounts_gene_females_trimmed:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.geneCounts_XX.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g gene_name -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_gene_males_trimmed:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.geneCounts_XY.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g gene_name -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_transcript_females_trimmed:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.transcriptCounts_XX.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g transcript_id -O -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        
rule featureCounts_transcript_males_trimmed:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        counts = "trimq_{tq}_minlen_{ml}/featureCounts/{sample_name}_trimmed.transcriptCounts_XY.txt",
    params:
        featureCounts = featureCounts_path,
        GTF = annotation_path
    shell:
        "{params.featureCounts} -T 8 --primary -p -s 2 -t exon -g transcript_id -O -a {params.GTF} -o {output.counts} {input.rdgrp_bam}"
        

