import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

recetas = pd.read_csv(snakemake.input[0])
pais = snakemake.params.pais

recetas = recetas[recetas['country'] == pais]

plt.figure(figsize=(10, 6))

# Dotplot: total_time vs avg_rating
sns.scatterplot(x='total_time', y='avg_rating', data=recetas, s=80, color='dodgerblue',
                 edgecolor='black')

# Linear regression line
sns.regplot(x='total_time', y='avg_rating', data=recetas, scatter=False, color='red', 
            line_kws={'linewidth':2})

plt.xlabel('Tiempo Total (minutos)')
plt.ylabel('Calificación Promedio')
plt.title(f'Recetas de: {pais}')
plt.tight_layout()

plt.savefig(snakemake.output[0], dpi=300)
