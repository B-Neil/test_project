configfile: "config/config.yaml"
config["threads"] = workflow.cores


#Module_1
include: "workflow/rules/module_1/recognizer.smk"
include: "workflow/rules/module_1/eggnogmapper.smk"
#include: "workflow/rules/module_1/upimapi.smk"


#Module_2
include: "workflow/rules/module_2/colabfold.smk"
include: "workflow/rules/module_2/deepfri.smk"
include: "workflow/rules/module_2/foldseek.smk"

#Module_3




rule all:
    input:
        os.path.join("results", "recognizer_results", "reCOGnizer_results.tsv"),
        #os.path.join(config["output_dir"], "upimapi_results")
        os.path.join(config["output_dir"], "eggnogmapper_results", "eggnog_mapper_results.emapper.annotations"),
        "results/colabfold",
        os.path.join(config["output_dir"], "deepfri", "MF_predictions.csv"),
        "data/deepfri_models/trained_models.tar.gz"