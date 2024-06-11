# Load required libraries
library(ggplot2)
library(paletteer)
library(reshape2)

# Create a sample matrix to simulate data
set.seed(123)
data_matrix <- matrix(runif(625, min = 0, max = 1), nrow = 25, ncol = 25)
rownames(data_matrix) <- rev(LETTERS[1:25])
colnames(data_matrix) <- LETTERS[1:25]

# Melt the matrix to a long format
data_long <- melt(data_matrix)

# Plot using ggplot2
ggplot(data_long, aes(x = Var2, y = Var1, fill = value)) +
   geom_tile() +
   scale_fill_paletteer_c("ggthemes::Sunset-Sunrise Diverging") +
   labs(x = NULL, y = NULL) +
   theme_minimal() +
   theme(
      axis.text.x = element_text(size = 12, angle = 0, hjust = 0.5),
      axis.text.y = element_text(size = 12, angle = 0, vjust = 0.5),
      panel.grid = element_blank(),
      legend.position = "none"
   )

# Save the plot as an image file
ggsave("heatmap.png", width = 8, height = 8, dpi = 300)
