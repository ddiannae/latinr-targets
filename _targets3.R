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
      !is.na(calories) &
      total_ratings >= 5
    ) |>
    select(name, country, total_time, avg_rating, total_ratings, calories)
}

calcular_eficiencia <- function(data) {
  data |>
    mutate(
      eficiencia_cal = avg_rating / calories
    ) |>
    filter(eficiencia_cal < 1)
}

filtrar_latam <- function(data) {
  latam_countries <- c("Cuban", "Brazilian", "Puerto Rican", "Peruvian",
                       "Argentinian", "Chilean", "Colombian", "Tex-Mex")
  data |>
    filter(country %in% latam_countries)
}


tar_plan(
  tar_file_read(
    recetas_raw,
    "_targets/user/data/recetas.csv",
    read_csv(!!.x)
  ),
  recetas = limpiar_datos(recetas_raw),
  recetas_eficiencia = calcular_eficiencia(recetas),
  recetas_latam = filtrar_latam(recetas_eficiencia),
  tar_group_by(
    recetas_grouped,
    recetas_latam,
    country
  ),
  tar_target(
    recetas_top,
    slice_max(recetas_grouped, eficiencia_cal, n = 3),
    pattern = map(recetas_grouped)
  ),
  tar_quarto(
    reporte_eficiencia,
    path = "reportes/reporte_eficiencia.qmd"
  )
)
