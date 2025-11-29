library(targets)
library(tarchetypes)
library(readr)
library(dplyr)

limpiar_datos <- function(data) {
  data |>
    filter(
      !is.na(total_ratings) &
        !is.na(avg_rating) &
        !is.na(total_time) &
        total_time > 5 &
        total_time < 300
    ) |>
    select(name, country, total_time, avg_rating, total_ratings)
}

resumir_datos <- function(data) {
  data |>
    group_by(country) |>
    summarise(
      recetas = n(),
      tiempo_promedio = mean(total_time, na.rm = T),
      evaluacion_promedio = mean(avg_rating, na.rm = T),
      numero_evaluaciones = sum(total_ratings)
    )
}

guardar_archivo <- function(data, archivo) {
  write_csv(data, archivo)
  return(archivo)
}

tar_plan(
  tar_file_read(
    recetas_raw,
    "_targets/user/data/recetas.csv",
    read_csv(!!.x)
  ),
  recetas = limpiar_datos(recetas_raw),
  recetas_resumen = resumir_datos(recetas),
  tar_file(
    archivo_recetas_resumen,
    guardar_archivo(
      recetas_resumen,
      archivo = "_targets/user/data/recetas_resumen.csv"
    )
  ),
  tar_quarto(
    reporte_recetas,
    path = "reportes/reporte_recetas.qmd"
  )
)
