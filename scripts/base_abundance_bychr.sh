#!/bin/bash

#PBS -N snptest
#PBS -l nodes=1:ppn=1
#PBS -l walltime=12:00:00

### What is my phenotype to test ?
VAR1=G_Akkermansia

### What is my normalization type ?
NORM=RNT

### Run by chromosome
CHR=allreplicationmarkers.gen

### move to directory with genotype data
cd /yourcompletedirectorypath/

## make a new directory, base on phenotype, to place my data in:
mkdir /yourcompletedirectorypath/${VAR1}
mkdir /yourcompletedirectorypath/${VAR1}/${NORM}
mkdir /yourcompletedirectorypath/${VAR1}/${NORM}/log/

### load my snptest module
module add apps/snptest.2.5.0 

### Running a Chromosome at a time
time snptest_v2.5 -data ${CHR} /yourcompletedirectorypath/FGFP.sample -o /yourcompletedirectorypath/$VAR1/${NORM}/${CHR}.out -log /yourcompletedirectorypath/$VAR1/${NORM}/log/${CHR}.log -frequentist 1 -method score -pheno ${VAR1}_${NORM} -use_raw_phenotypes
