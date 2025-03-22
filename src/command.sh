#!/bin/bash -ue
mkdir WT_REP1

fastqc -t 1 -q SRR6357070_1.fastq.gz SRR6357070_2.fastq.gz -o WT_REP1
