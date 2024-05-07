#!/bin/bash
#SBATCH --job-name=fastqc  # Job name
#SBATCH -o slurm.%j.out                # STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err                # STDERR (%j = JobId)
#SBATCH --mail-type=ALL           # notifications for job done & fail
#SBATCH --mail-user=splaisie@asu.edu # send-to address

source activate /home/splaisie/mambaforge/envs/placenta_RNA_env3/

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_10/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_10/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_10/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_30/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_30/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_30/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_75/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_75/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_0_minlen_75/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_10/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_10/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_10/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_30/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_30/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_30/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_75/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_75/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_10_minlen_75/fastq/

PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_10/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_10/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_10/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_30/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_30/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_30/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_75/qc/
mkdir /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_75/qc/fastqc/
cd /data/CEM/wilsonlab/projects/GenomicsCURE/PlacentaSexDifferences_trimmed/01_data_generation/trimq_30_minlen_75/fastq/
PERL5LIB=/home/splaisie/mambaforge/pkgs/perl-5.26.2-h14c3975_0/ fastqc *fastq.gz -o ../qc/fastqc

