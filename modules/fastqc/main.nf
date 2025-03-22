nextflow.preview.dsl=2


process FastQC {
    tag "$sample_id"

    publishDir "${params.output_dir}/fastqc", mode: 'copy'
    container 'biocontainers/fastqc:0.12.1--hdfd78af_0'
    input:
    tuple val (sample_id), path(reads)

    output:
    path "${sample_id}", emit: fastqc_report

    script:
    """
    mkdir ${sample_id}
    
    fastqc -t ${task.cpus} -q ${reads.join(' ')} -o ${sample_id}
    """
}
