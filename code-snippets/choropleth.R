library(sf)
library(ggplot2)

# Geospatial data available at the geojson format
tmp_geojson <- tempfile(fileext = ".geojson")
download.file(
   "https://raw.githubusercontent.com/JosephBARBIERDARNAL/R-graph-gallery/master/DATA/world.geojson",
   tmp_geojson
)
my_sf <- read_sf(tmp_geojson)

# Remove antarctica from the map
my_sf <- my_sf[my_sf$name != "Antarctica", ]

# Add random numeric values to the map
my_sf$random_value <- runif(nrow(my_sf))


ggplot(my_sf) +
   geom_sf(aes(fill = random_value), color = "black", linewidth = 0.3) +
   theme_void() +
   theme(legend.position = "none") +
   scale_fill_paletteer_c("ggthemes::Classic Orange")

# Save the plot as an image file
ggsave("choropleth.png", width = 8, height = 6, dpi = 300)
