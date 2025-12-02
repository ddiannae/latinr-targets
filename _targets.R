library(targets)
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

list(
  tar_target(
    recetas_raw,
    read_csv(
      "https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-09-16/cuisines.csv"
    )
  ),
  tar_target(recetas, limpiar_datos(recetas_raw))
)
