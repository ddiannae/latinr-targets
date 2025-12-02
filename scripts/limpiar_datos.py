import pandas as pd

recetas = pd.read_csv(snakemake.params[0])

recetas = recetas.dropna(subset=["total_ratings", "avg_rating", "total_time"])
recetas = recetas[(recetas["total_time"] > 5) & (recetas["total_time"] < 300)]
recetas["country"] = recetas["country"].str.strip().str.lower()

print(f"Total de recetas después de los filtros: {len(recetas)}")
recetas[["name", "country", "total_time", "avg_rating", "total_ratings"]].to_csv(snakemake.output[0], index=False)
print(f"Datos guardados en {snakemake.output[0]}")