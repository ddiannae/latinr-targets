
configfile: "config.yaml"

paises_latam = ["cuban", "brazilian", "argentinian", "peruvian", "chilean", "colombian", "tex-mex"]

rule all:
    input:
        expand(config["output_dir"] + "/grafica_{pais}.png", pais=paises_latam)

rule generar_grafica:
    input:
        "data/recetas.csv",
        config["output_dir"] + "/done.txt"
    output:
        config["output_dir"] + "/grafica_{pais}.png"
    params:
        pais="{pais}"
    script:
        "scripts/graficar.py"

# rule generar_grafica:
#     input:
#         "data/recetas.csv"
#     output:
#         "plots/grafica1.png"
#     params:
#         pais="argentinian"
#     script:
#         "scripts/graficar.py"

rule limpiar_datos:
    params:
        "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-09-16/cuisines.csv"
    output:
        "data/recetas.csv"
    script:
        "scripts/limpiar_datos.py"

rule crear_directorio:
    output:
        directory(config["output_dir"]),
        config["output_dir"] + "/done.txt"
    shell:
        """mkdir -p {output[0]}
        touch {output[1]} """
