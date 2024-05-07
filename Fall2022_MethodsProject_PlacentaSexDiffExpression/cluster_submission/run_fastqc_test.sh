#!/bin/bash
#SBATCH --job-name=fastqc  # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH --mail-type=ALL           # notifications for job done & fail
#SBATCH --mail-user=splaisie@asu.edu # send-to address

source activate /home/splaisie/mambaforge/envs/placenta_RNA_env3/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_NONE_minlen_NONE/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

