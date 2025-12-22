# Material para el workshop: Automatización de workflows en R y Python con targets y snakemake

Este material fue desarrollado para presentarse en el workshop "Automatización de workflows en R y Python con targets y snakemake", en la conferencia LatinR 2025. Más información sobre el evento y otros tutoriales disponibles en: [Tutoriales LatinR 2025](https://latinr.org/cronograma/tutoriales/)

La pequeña presentación que acompaña este contenido puedes encontrarla en [Presentación](https://ddiannae.github.io/latinr_targets/Presentacion.html)

## Descripción de las notebooks

Para los ejemplos utilicé el dataset [**Allrecipes**](https://github.com/rfordatascience/tidytuesday/blob/main/data/2025/2025-09-16/readme.md), que contiene información sobre recetas de cocina y fue el dataset de TidyTuesday de la semana 37 del 2025.

El material incluye las siguientes notebooks:

- **1-PipelineBasico.qmd**: Introducción al uso de `targets` en R. Explica cómo estructurar un pipeline básico, definir objetivos o targets y ejecutar un flujo de trabajo desde un archivo `_targets.R`. Archivos asociados:
	- `_targets1.R`: Archivo de definición del pipeline.


- **2-GenerandoReportes.qmd**: Muestra cómo generar reportes automáticos y reproducibles integrando `targets` con Quarto. Se utilizan funciones del paquete `tarchetypes` para simplificar la definición de targets y se ejemplifica la creación de reportes dinámicos a partir de los resultados del pipeline. Archivos asociados:
	- `_targets2.R`: Archivo de definición del pipeline con generación de reportes.
	- `reportes/reporte_recetas.qmd`: Reporte resumen de recetas por país o tipo de cocina, con visualizaciones sobre cantidad, evaluación promedio y tiempo de preparación.

- **3-Branching.qmd**: Aborda el concepto de ramificación en `targets` para aplicar el mismo análisis a diferentes subconjuntos de datos. Explica cómo implementar branching dinámico para analizar recetas por país. Archivos asociados:
	- `_targets3.R`: Archivo de definición del pipeline con branching.
	- `reportes/reporte_eficiencia.qmd`: Reporte que muestra el top de recetas latinoamericanas con mayor eficiencia calórica.

- **4-Snakemake.qmd**: Introducción a Snakemake. Se explica la estructura de un `Snakefile`, definición de reglas, uso de wildcards para branching e integración de scripts en Python y otros lenguajes. Incluye ejemplos de visualización y uso de archivos de configuración.

Estas notebooks están diseñadas para ser revisados en orden y pretenden ser autocontenidos. Si encuentras algún error o tienes sugerencias, no dudes en abrir un issue.


## Instalación de dependencias
1. Instala las dependencias de R usando `renv::restore()` desde R.
2. Instala las dependencias de Python con conda usando `conda env create -f environment.yml`
