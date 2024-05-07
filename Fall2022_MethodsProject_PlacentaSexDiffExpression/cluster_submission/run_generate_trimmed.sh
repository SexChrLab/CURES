#!/bin/bash
#SBATCH --job-name=placentaRNA  # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH --mail-type=ALL           # notifications for job done & fail
#SBATCH --mail-user=splaisie@asu.edu # send-to address
#SBATCH -t 3-00:00
#SBATCH -n 2

source activate /home/splaisie/mambaforge/envs/placenta_RNA_env3/
snakemake -s generate_trimming_data.snakefile -j 100 --rerun-incomplete --latency-wait=60 --cluster "sbatch -n 2 --mem=28G --mail-type=FAIL --mail-user=splaisie@asu.edu"
