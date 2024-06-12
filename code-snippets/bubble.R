# Load necessary libraries
library(ggplot2)
library(paletteer)

df <- read.csv("https://raw.githubusercontent.com/holtzy/The-Python-Graph-Gallery/master/static/data/simple-scatterplot.csv")

# Create the ggplot
ggplot(df, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
   geom_point(size=10) +
   scale_color_paletteer_d("futurevisions::atomic_blue") +
   theme_minimal() +
   theme(legend.position = "none")
# Save the plot as an image file
ggsave("bubble_plot.png", width = 8, height = 6, dpi = 300)


