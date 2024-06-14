# Load necessary libraries
library(ggplot2)
library(paletteer)

# Sample data
data <- read.csv("https://raw.githubusercontent.com/holtzy/The-Python-Graph-Gallery/master/static/data/simple-piechart.csv")

# Create the pie chart
ggplot(data, aes(x = "", y = value, fill = name)) +
   geom_bar(stat = "identity", width = 1) +
   geom_text(aes(label = paste0(name, ": ", value)), position = position_stack(vjust = 0.5)) +
   coord_polar(theta = "y") +
   theme_void() +
   scale_fill_paletteer_d("MoMAColors::Abbott") +
   theme(legend.position = "none") +
   labs(fill = "Category")

# Save the plot as an image file
ggsave("pie_chart.png", width = 8, height = 6, dpi = 300)
