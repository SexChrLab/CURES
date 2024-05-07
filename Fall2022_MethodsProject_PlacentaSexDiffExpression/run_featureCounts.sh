#!/bin/bash
#SBATCH --job-name=featurecounts  # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH --mail-type=ALL           # notifications for job done & fail
#SBATCH --mail-user=splaisie@asu.edu # send-to address

source activate /home/splaisie/mambaforge/envs/placenta_RNA_env3/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/
snakemake -s feature_counts.snakefile -j 100 --rerun-incomplete --latency-wait=60 --cluster "sbatch -n 2 --mem=20G --mail-type=FAIL --mail-user=splaisie@asu.edu"
