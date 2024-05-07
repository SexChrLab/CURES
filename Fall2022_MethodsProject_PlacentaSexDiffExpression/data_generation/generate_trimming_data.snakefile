import os

configfile: "config_B1_labgenerated.json"

# Tool paths:
bbduksh_path = "bbduk.sh"
adapter_path = "/data/CEM/shared/public_data/references/adapters/illumina_adapter.fa"

rule all:
    input:
        # collect untrimmed with symbolic links (no trimq or minlen)
        expand("trimq_NONE_minlen_NONE/fastq/{sample_name}_{run}.fastq.gz", sample_name = config["sample_names"], run=["R1","R2"]),
        # trimq = 0, minlen = 10 (default)
        # trimq = 0, minlen = 30
        # trimq = 0, minlen = 75
        expand("trimq_0_minlen_{ml}/fastq/{sample_name}_trimmed_{run}.fastq.gz", sample_name = config["sample_names"],ml = ["10","30","75"],run=["R1","R2"]),
        # trimq = 10 (default), minlen = 10 (default) 
        # trimq = 10 (default), minlen = 30
        # trimq = 10 (default), minlen = 75
        expand("trimq_10_minlen_{ml}/fastq/{sample_name}_trimmed_{run}.fastq.gz", sample_name = config["sample_names"],ml = ["10","30","75"],run=["R1","R2"]),
        # trimq = 30, minlen = 10 (default)
        # trimq = 30, minlen = 30
        # trimq = 30, minlen = 75
        expand("trimq_30_minlen_{ml}/fastq/{sample_name}_trimmed_{run}.fastq.gz", sample_name = config["sample_names"],ml = ["10","30","75"],run=["R1","R2"])
        

#============================================================================================  
# link for untrimmed
#============================================================================================  


rule mk_sy_ln_fastqs:
    input:
        original_R1 = lambda wildcards: config[wildcards.sample_name]["fq_path"] + config[wildcards.sample_name]["fq1"],
        original_R2 = lambda wildcards: config[wildcards.sample_name]["fq_path"] + config[wildcards.sample_name]["fq2"]
    output:
        R1_out = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R1.fastq.gz",
        R2_out = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R2.fastq.gz"
    shell:
        """
        ln -s {input.original_R1} {output.R1_out};
        ln -s {input.original_R2} {output.R2_out}
        """

#============================================================================================  
# trim [parameters to modify: trimq, minlen]
#============================================================================================  
rule trim_adapters_paired_bbduk_trimq_0:
    input:
        fq1 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq1"]),
        fq2 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq2"])
    output:
        out_fq1 = "trimq_0_minlen_{ml}/fastq/{sample_name}_trimmed_R1.fastq.gz",
        out_fq2 = "trimq_0_minlen_{ml}/fastq/{sample_name}_trimmed_R2.fastq.gz"
    params:
        bbduksh = bbduksh_path,
        adapter = adapter_path,
        minleninput = "{ml}"
    shell:
        "{params.bbduksh} -Xmx3g in1={input.fq1} in2={input.fq2} "
        "out1={output.out_fq1} out2={output.out_fq2} "
        "ref={params.adapter} "
        "trimq=0 minlen={params.minleninput}"

rule trim_adapters_paired_bbduk_trimq_10:
    input:
        fq1 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq1"]),
        fq2 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq2"])
    output:
        out_fq1 = "trimq_10_minlen_{ml}/fastq/{sample_name}_trimmed_R1.fastq.gz",
        out_fq2 = "trimq_10_minlen_{ml}/fastq/{sample_name}_trimmed_R2.fastq.gz"
    params:
        bbduksh = bbduksh_path,
        adapter = adapter_path,
        minleninput = "{ml}"
    shell:
        "{params.bbduksh} -Xmx3g in1={input.fq1} in2={input.fq2} "
        "out1={output.out_fq1} out2={output.out_fq2} "
        "ref={params.adapter} "
        "minlen={params.minleninput}"

rule trim_adapters_paired_bbduk_trimq_30:
    input:
        fq1 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq1"]),
        fq2 = lambda wildcards: os.path.join(config[wildcards.sample_name]["fq_path"], config[wildcards.sample_name]["fq2"])
    output:
        out_fq1 = "trimq_30_minlen_{ml}/fastq/{sample_name}_trimmed_R1.fastq.gz",
        out_fq2 = "trimq_30_minlen_{ml}/fastq/{sample_name}_trimmed_R2.fastq.gz"
    params:
        bbduksh = bbduksh_path,
        adapter = adapter_path,
        minleninput = "{ml}"
    shell:
        "{params.bbduksh} -Xmx3g in1={input.fq1} in2={input.fq2} "
        "out1={output.out_fq1} out2={output.out_fq2} "
        "ref={params.adapter} "
        "trimq=30 minlen={params.minleninput}"

