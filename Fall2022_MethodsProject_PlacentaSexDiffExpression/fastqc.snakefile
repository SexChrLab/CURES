# SOMETHING IS NOT LINKING UP PROPERLY

configfile: "config_B1_labgenerated.json"

# Tool paths:
fastqc_path = "PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc"
#fastqc_path = "fastqc"
multiqc_path = "multiqc"

rule all:
    input:
        expand("trimq_NONE_minlen_NONE/qc/fastc/{sample_name}_R1_fastqc.html", sample_name = config["sample_names"]),
        expand("trimq_NONE_minlen_NONE/qc/fastc/{sample_name}_R2_fastqc.html", sample_name = config["sample_names"]),
        "trimq_NONE_minlen_NONE/qc/multiqc/multiqc_report.html"

rule fastqc_analysis_untrimmed:
    input:
        R1 = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R1.fastq.gz",
        R2 = "trimq_NONE_minlen_NONE/fastq/{sample_name}_R2.fastq.gz"
    output:
        F1 = "trimq_NONE_minlen_NONE/qc/fastqc/{sample_name}_R1_fastqc.html",
        F2 = "trimq_NONE_minlen_NONE/qc/fastqc/{sample_name}_R2_fastqc.html"
    params: 
        path = fastqc_path,
        output_directory = "trimq_NONE_minlen_NONE/qc/fastqc/"
    shell:
        """
        {params.path} -o {params.output_directory} {input.R1}, 
        {params.path} -o {params.output_directory} {input.R2} 
        """

rule multiqc_analysis_untrimmed:
    input:
        expand("trimq_NONE_minlen_NONE/qc/fastqc/{sample_name}_{read}_fastqc.html",sample_name=config["sample_names"],read=["R1", "R2"])
    output:
        "trimq_NONE_minlen_NONE/qc/multiqc/multiqc_report.html"
    params:
        path = multiqc_path,
        mdirectory = "trimq_NONE_minlen_NONE/qc/multiqc/",
        fdirectory = "trimq_NONE_minlen_NONE/qc/fastqc/"
    shell:
        """
        {params.path} -o {params.mdirectory} {params.fdirectory}
        """

