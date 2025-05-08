rule foldseek_search:
    input:
        query="results/colabfold",
    output:
        alignment="results/foldseek/"
    conda:
        "../../envs/module_2/foldseek.yaml"
    threads: 4
    shell:
        """
        mkdir -p results/foldseek/
        foldseek easy-search {input.query} {input.db} {output.alignment} tmp/foldseek_{wildcards.sample} \
            --format-output "query,target,pident,alnlen,bits,qlen,tlen,evalue"
        """
