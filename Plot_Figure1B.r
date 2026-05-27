# ==============================================================================
# Script: Plot_Figure1B.R
# Purpose: Generate the Genetic Correlation Landscape (Figure 1B)
# Usage: Ensure 'Final_GCTA_rG_Results.csv' is in the working directory.
# ==============================================================================

# 1. Load required libraries
library(pheatmap)
library(reshape2)

# 2. Load the input data
# Ensure the CSV file is located in the same directory as this script
df_rg <- read.csv("Final_GCTA_rG_Results.csv", stringsAsFactors = FALSE)
df_rg <- df_rg[, 1:3]
colnames(df_rg) <- c("Trait_A", "Trait_B", "rG")
df_rg$Trait_A <- trimws(df_rg$Trait_A)
df_rg$Trait_B <- trimws(df_rg$Trait_B)

# 3. Construct and clean the genetic correlation matrix
mat <- acast(rbind(df_rg, data.frame(Trait_A=df_rg$Trait_B, Trait_B=df_rg$Trait_A, rG=df_rg$rG)), 
             Trait_A ~ Trait_B, value.var = "rG", fun.aggregate = mean, fill = 0)
diag(mat) <- 1

# Filter out rows/columns with negligible genetic correlation (besides diagonal)
mat_clean <- mat[rowSums(abs(mat) > 0.001) > 1, colSums(abs(mat) > 0.001) > 1]

# 4. Generate the heatmap
# Output saved as a 300 DPI PNG file
png("Figure_1B_Genetic_Correlation_Landscape.png", width = 3000, height = 3000, res = 300)

pheatmap(mat_clean, 
         color = colorRampPalette(c("#2166AC", "white", "#D73027"))(100), 
         breaks = seq(-1, 1, length.out = 100),
         cluster_rows = TRUE, 
         cluster_cols = TRUE,
         angle_col = 45,
         border_color = "black", 
         fontsize = 14,
         main = NA,
         treeheight_row = 100,
         treeheight_col = 100,
         legend = TRUE)

dev.off()
cat("Figure 1B has been generated successfully.\n")