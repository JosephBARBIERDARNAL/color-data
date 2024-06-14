rm(list=ls())
library(treemapify)
library(ggplot2)
library(paletteer)

df <- read_csv(
   "https://raw.githubusercontent.com/holtzy/The-Python-Graph-Gallery/master/static/data/simple-treemap.csv",
   show_col_types = FALSE
)

ggplot(df, aes(area = value, fill = parent, label = name)) +
   geom_treemap() +
   geom_treemap_text(colour = "white",
                     place = "centre") +
   scale_fill_paletteer_d("MoMAColors::Abbott") +
   theme(legend.position = "none")

ggsave("treemap.png", width = 8, height = 6, dpi = 300)