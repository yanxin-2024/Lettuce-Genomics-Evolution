# Lettuce-Genomics-Evolution

This repository contains the core analysis script and representative dataset supporting the manuscript: "Genomic partitioning and precision molecular pruning dictate the modular evolution of cultivated lettuce."

## Contents
- `Plot_Figure1B.r`: R script for genetic correlation analysis and heatmap visualization (Figure 1B).
- `Final_GCTA_rG_Results.csv`: Representative dataset used for generating Figure 1B.

## Reproducibility
To reproduce the plot:
1. Ensure the `pheatmap` and `reshape2` R packages are installed in your R environment.
2. Ensure the `Final_GCTA_rG_Results.csv` file is located in the same directory as the script.
3. Run the script using the following command:
   ```R
   source("Plot_Figure1B.r")
