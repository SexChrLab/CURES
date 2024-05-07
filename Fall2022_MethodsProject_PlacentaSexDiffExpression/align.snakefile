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

REF_TYPE = ["Ref_GRCh38","Ref_GRCh38_Y_HardMasked","Ref_GRCh38_Y_PARsMasked"]
REF_TYPE_HISAT = ["Ref_GRCh38_Y_HardMasked_HISAT_index","Ref_GRCh38_Y_PARsMasked_HISAT_index"]

rule all:
    input:
        # align 
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sam", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sam", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sam", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sam", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # convert alignment sam to bam
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.bam", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.bam", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.bam", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.bam", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # sort bam
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.bam", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.bam", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.bam", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.bam", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # mark duplicates
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.bam", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.bam", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.bam", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.bam", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # add read groups
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # index
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam.bai", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam.bai", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam.bai", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam.bai", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # bamtools stats
        expand("trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.stats.txt", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.stats.txt", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.stats.txt", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.stats.txt", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"]),
        # samtools flagstat stats
        expand("trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.flagstats.txt", sample_name = config["females"]),
        expand("trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.flagstats.txt", sample_name = config["males"]),
        expand("trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.flagstats.txt", sample_name = config["females"], tq = ["0","10","30"], ml = ["10","30","75"]),
        expand("trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.flagstats.txt", sample_name = config["males"], tq = ["0","10","30"], ml = ["10","30","75"])



#============================================================================================  
# align untrimmed to GRCh38 SCC
#============================================================================================  


rule align_untrimmed_females:
    input:
        R1_in = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R1.fastq.gz",
        R2_in = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R2.fastq.gz"
    output:
        sam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sam",
    params:
        HISAT_Index_female = config["HG38_Transcriptome_Index_HISAT_Path_female"],
    shell:
        perllib_path + " hisat2 -q --rna-strandness RF -p 8 -x {params.HISAT_Index_female} -1 {input.R1_in} -2 {input.R2_in} -S {output.sam}"

rule align_untrimmed_males:
    input:
        R1_in = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R1.fastq.gz",
        R2_in = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R2.fastq.gz"
    output:
        sam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sam",
    params:
        HISAT_Index_male = config["HG38_Transcriptome_Index_HISAT_Path_male"],
    shell:
        perllib_path + " hisat2 -q --rna-strandness RF -p 8 -x {params.HISAT_Index_male} -1 {input.R1_in} -2 {input.R2_in} -S {output.sam}"

#============================================================================================  
# align trimmed to GRCh38 SCC
#============================================================================================  

rule align_trimmed_females:
    input:
        R1_in = "trimq_{tq}_minlen_{ml}/fastq/{sample_name}_trimmed_R1.fastq.gz",
        R2_in = "trimq_{tq}_minlen_{ml}/fastq/{sample_name}_trimmed_R2.fastq.gz"
    output:
        sam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sam",
    params:
        HISAT_Index_female = config["HG38_Transcriptome_Index_HISAT_Path_female"],
    shell:
        perllib_path + " hisat2 -q --rna-strandness RF -p 8 -x {params.HISAT_Index_female} -1 {input.R1_in} -2 {input.R2_in} -S {output.sam}"

rule align_trimmed_males:
    input:
        R1_in = "trimq_{tq}_minlen_{ml}/fastq/{sample_name}_trimmed_R1.fastq.gz",
        R2_in = "trimq_{tq}_minlen_{ml}/fastq/{sample_name}_trimmed_R2.fastq.gz"
    output:
        sam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sam",
    params:
        HISAT_Index_male = config["HG38_Transcriptome_Index_HISAT_Path_male"],
    shell:
        perllib_path + " hisat2 -q --rna-strandness RF -p 8 -x {params.HISAT_Index_male} -1 {input.R1_in} -2 {input.R2_in} -S {output.sam}"

#============================================================================================  
# post processing - convert to bam, mark duplicates, calc stats
#============================================================================================  
     
# untrimmed, females
rule convert_to_bam_untrimmed_females:
    input:
        sam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sam",
    output:
        bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.bam",
    shell:
        "samtools view -b {input.sam} > {output.bam}"

rule bam_sort_untrimmed_females:  
    input:
        bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.bam",
    output:
        sort_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.bam",
    shell:
        "bamtools sort -in {input.bam} -out {output.sort_bam}"

rule MarkDups_untrimmed_females:
    input:
        sort_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.bam",
    output:
        dedup_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.bam",
        metrics = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XX.sort.mkdup.metrics.txt",
    params:
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g MarkDuplicates I={input.sort_bam} O={output.dedup_bam} "
        "M={output.metrics} VALIDATION_STRINGENCY=LENIENT"

rule AddReadGrps_untrimmed_females:
    input:
        dedup_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.bam",
    output:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam",
    params:
        id = lambda wildcards: config[wildcards.sample_name]["ID"],
        sm = lambda wildcards: config[wildcards.sample_name]["SM"],
        lb = lambda wildcards: config[wildcards.sample_name]["LB"],
        pu = lambda wildcards: config[wildcards.sample_name]["PU"],
        pl = lambda wildcards: config[wildcards.sample_name]["PL"],
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g AddOrReplaceReadGroups I={input.dedup_bam} O={output.rdgrp_bam} "
        "RGID={params.id} RGPU={params.pu} RGSM={params.sm} RGPL={params.pl} RGLB={params.lb} VALIDATION_STRINGENCY=LENIENT"

rule index_bam_untrimmed_females:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        rdgrp_bai = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam.bai"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} index -in {input.rdgrp_bam}"

rule stats_bam_untrimmed_females:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.stats.txt"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} stats -in {input.rdgrp_bam} > {output.rdgrp_stats}"
 
rule stats_sam_untrimmed_females:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XX.sort.mkdup.rdgrp.flagstats.txt"
    params:
        samtools = samtools_path
    shell:
        "{params.samtools} flagstat {input.rdgrp_bam} > {output.rdgrp_stats}"
 
# trimmed, females
rule convert_to_bam_trimmed_females:
    input:
        sam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sam",
    output:
        bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.bam",
    shell:
        "samtools view -b {input.sam} > {output.bam}"

rule bam_sort_trimmed_females:  
    input:
        bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.bam",
    output:
        sort_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.bam",
    shell:
        "bamtools sort -in {input.bam} -out {output.sort_bam}"

rule MarkDups_trimmed_females:
    input:
        sort_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.bam",
    output:
        dedup_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.bam",
        metrics = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XX.sort.mkdup.metrics.txt",
    params:
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g MarkDuplicates I={input.sort_bam} O={output.dedup_bam} "
        "M={output.metrics} VALIDATION_STRINGENCY=LENIENT"

rule AddReadGrps_trimmed_females:
    input:
        dedup_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.bam",
    output:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam",
    params:
        id = lambda wildcards: config[wildcards.sample_name]["ID"],
        sm = lambda wildcards: config[wildcards.sample_name]["SM"],
        lb = lambda wildcards: config[wildcards.sample_name]["LB"],
        pu = lambda wildcards: config[wildcards.sample_name]["PU"],
        pl = lambda wildcards: config[wildcards.sample_name]["PL"],
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g AddOrReplaceReadGroups I={input.dedup_bam} O={output.rdgrp_bam} "
        "RGID={params.id} RGPU={params.pu} RGSM={params.sm} RGPL={params.pl} RGLB={params.lb} VALIDATION_STRINGENCY=LENIENT"

rule index_bam_trimmed_females:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam",
    output:
        rdgrp_bai = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam.bai"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} index -in {input.rdgrp_bam}"

rule stats_bam_trimmed_females:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.stats.txt"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} stats -in {input.rdgrp_bam} > {output.rdgrp_stats}"

rule stats_sam_trimmed_females:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XX.sort.mkdup.rdgrp.flagstats.txt"
    params:
        samtools = samtools_path
    shell:
        "{params.samtools} flagstat {input.rdgrp_bam} > {output.rdgrp_stats}"


# untrimmed, males
rule convert_to_bam_untrimmed_males:
    input:
        sam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sam",
    output:
        bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.bam",
    shell:
        "samtools view -b {input.sam} > {output.bam}"

rule bam_sort_males:  
    input:
        bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.bam"
    output:
        sort_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.bam"
    shell:
        "bamtools sort -in {input.bam} -out {output.sort_bam}"

rule MarkDups_untrimmed_males:
    input:
        sort_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.bam"
    output:
        dedup_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.bam",
        metrics = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XY.sort.mkdup.metrics.txt"
    params:
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g MarkDuplicates I={input.sort_bam} O={output.dedup_bam} "
        "M={output.metrics} VALIDATION_STRINGENCY=LENIENT"

rule AddReadGrps_untrimmed_males:
    input:
        dedup_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.bam"
    output:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam"
    params:
        id = lambda wildcards: config[wildcards.sample_name]["ID"],
        sm = lambda wildcards: config[wildcards.sample_name]["SM"],
        lb = lambda wildcards: config[wildcards.sample_name]["LB"],
        pu = lambda wildcards: config[wildcards.sample_name]["PU"],
        pl = lambda wildcards: config[wildcards.sample_name]["PL"],
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g AddOrReplaceReadGroups I={input.dedup_bam} O={output.rdgrp_bam} "
        "RGID={params.id} RGPU={params.pu} RGSM={params.sm} RGPL={params.pl} RGLB={params.lb} VALIDATION_STRINGENCY=LENIENT"

rule index_bam_untrimmed_males:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        rdgrp_bai = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam.bai"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} index -in {input.rdgrp_bam}"

rule stats_bam_untrimmed_males:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.stats.txt"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} stats -in {input.rdgrp_bam} > {output.rdgrp_stats}"
 
rule stats_sam_untrimmed_males:
    input:
        rdgrp_bam = "trimq_NONE_minlen_NONE/processed_bams/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_NONE_minlen_NONE/stats/{sample_name}_untrimmed.XY.sort.mkdup.rdgrp.flagstats.txt"
    params:
        samtools = samtools_path
    shell:
        "{params.samtools} flagstat {input.rdgrp_bam} > {output.rdgrp_stats}"
 
# trimmed, males
rule convert_to_bam_trimmed_males:
    input:
        sam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sam",
    output:
        bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.bam",
    shell:
        "samtools view -b {input.sam} > {output.bam}"

rule bam_sort_trimmed_males:  
    input:
        bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.bam"
    output:
        sort_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.bam"
    shell:
        "bamtools sort -in {input.bam} -out {output.sort_bam}"

rule MarkDups_trimmed_males:
    input:
        sort_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.bam"
    output:
        dedup_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.bam",
        metrics = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XY.sort.mkdup.metrics.txt"
    params:
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g MarkDuplicates I={input.sort_bam} O={output.dedup_bam} "
        "M={output.metrics} VALIDATION_STRINGENCY=LENIENT"

rule AddReadGrps_trimmed_males:
    input:
        dedup_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.bam"
    output:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam"
    params:
        id = lambda wildcards: config[wildcards.sample_name]["ID"],
        sm = lambda wildcards: config[wildcards.sample_name]["SM"],
        lb = lambda wildcards: config[wildcards.sample_name]["LB"],
        pu = lambda wildcards: config[wildcards.sample_name]["PU"],
        pl = lambda wildcards: config[wildcards.sample_name]["PL"],
        picard = picard_path
    shell:
        "{params.picard} -Xmx14g AddOrReplaceReadGroups I={input.dedup_bam} O={output.rdgrp_bam} "
        "RGID={params.id} RGPU={params.pu} RGSM={params.sm} RGPL={params.pl} RGLB={params.lb} VALIDATION_STRINGENCY=LENIENT"

rule index_bam_trimmed_males:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam",
    output:
        rdgrp_bai = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam.bai"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} index -in {input.rdgrp_bam}"

rule stats_bam_trimmed_males:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.stats.txt"
    params:
        bamtools = bamtools_path
    shell:
        "{params.bamtools} stats -in {input.rdgrp_bam} > {output.rdgrp_stats}"
 
rule stats_sam_trimmed_males:
    input:
        rdgrp_bam = "trimq_{tq}_minlen_{ml}/processed_bams/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.bam"
    output:
        rdgrp_stats = "trimq_{tq}_minlen_{ml}/stats/{sample_name}_trimmed.XY.sort.mkdup.rdgrp.flagstats.txt"
    params:
        samtools = samtools_path
    shell:
        "{params.samtools} flagstat {input.rdgrp_bam} > {output.rdgrp_stats}"
 

