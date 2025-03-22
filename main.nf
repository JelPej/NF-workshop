#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

// Import the Seqtk module
include { FastQC } from './modules/fastqc/main'



// Define the workflow
workflow {
    // Read the sample sheet
   Channel
    .fromPath(params.input)
    .splitCsv(header: true)
    .map { row -> 
        def sample_id = row.sample
        def reads = [file(row.fastq_1), file(row.fastq_2)]
        tuple(sample_id, reads)
    }
    
    .set { fastq_ch }

    fastq_ch.view()
    
    // Run Seqtk sampling
    FastQC(fastq_ch)

   
}