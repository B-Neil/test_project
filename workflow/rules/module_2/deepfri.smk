rule download_deepfri_models:
    output:
        "data/deepfri_models/trained_models.tar.gz"
    shell:
        """
        mkdir -p data/deepfri_models
        wget https://users.flatironinstitute.org/~renfrew/DeepFRI_data/trained_models.tar.gz -P data/deepfri_models
        tar -xzvf data/deepfri_models/trained_models.tar.gz -C data/deepfri_models
        """


rule deepfri:
    input:
        pdb_dir = "results/colabfold",
        model_config = "data/deepfri_models/trained_models/model_config.json"  
    output:
        "results/deepfri/MF_predictions.csv"
    threads: config["threads"]
    conda:
        "../../envs/module_2/deepfri.yaml"
    shell:
        """
        mkdir -p results/deepfri
        python -m deepfrier.Predictor \
            --pdb_dir {input.pdb_dir} \
            --model_config {input.model_config} \
            --output results/deepfri \
            --output_fn_prefix MF_predictions.csv
        """
