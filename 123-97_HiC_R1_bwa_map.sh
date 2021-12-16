#!/bin/bash
#SBATCH --job-name=chg_HiC_R2_space_123
#SBATCH --partition=batch
#SBATCH --mail-type=ALL
#SBATCH --mail-user=chg85779@uga.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=50gb
#SBATCH --time=16:00:00
#SBATCH --output=Run123_CHG.%j.out
#SBATCH --error=Run123_CHG.%j.err

cd $SLURM_SUBMIT_DIR

#make a variable called "threads" to store the number of cpus that will be used for multi-threaded analysis
threads=8

module load BWA/0.7.17-GCC-8.3.0

module load SAMtools/0.1.19-foss-2019b

bwa mem -A1 -B4 -E50 -L0 -t 8 /home/chg85779/Genomes/GCF_000002655.1_ASM265v1_genomic.fna \
	/scratch/chg85779/Run123/Fastq/123-97_Afum_HiC_S39_R1_001.fastq.gz 2>>/scratch/chg85779/Run123/Fastq/123-97_HiC_R1_test.log | samtools view -Shb - > /scratch/chg85779/Run123/Fastq/123-97_HiC_R1_test.bam 
