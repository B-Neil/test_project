import os

rule upimapi:
    input:
        fasta = config["input_fasta"]
    output:
        tsv = os.path.join(config["output_dir"], "upimapi_results.tsv")
    threads: config["threads"]
    conda:
        "../../envs/module_1/upimapi.yaml"
    shell:
        """
        mkdir -p {config[output_dir]}
        upimapi -i {input.fasta} -o {output.tsv} -t {threads}
        """
