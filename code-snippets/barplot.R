# Load necessary libraries
library(ggplot2)
library(paletteer)

# Create a sample dataset
data <- read_csv("https://raw.githubusercontent.com/holtzy/The-Python-Graph-Gallery/master/static/data/simple-barplot.csv")

# Reorder the factor levels to display the bars in the correct order
data$name <- factor(data$name, levels = rev(data$name))
data <- mutate(data, name = fct_reorder(name, value))

# Create the plot
ggplot(data, aes(x = value, y = name, fill = name)) +
   geom_col() +
   scale_fill_paletteer_d("MoMAColors::Abbott") +
   theme_minimal() +
   theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      legend.position = "none"
   )

# Save the plot as an image file
ggsave("barplot.png", width = 8, height = 6, dpi = 300)
