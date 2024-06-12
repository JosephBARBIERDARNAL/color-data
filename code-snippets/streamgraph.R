

library(streamgraph)
library(tidyverse)
library(paletteer)

data <- read.csv("code-snippets/datastream.csv")
# Reshape the data
long_data <- data %>%
   pivot_longer(cols = starts_with("group"), names_to = "name", values_to = "value")

# Rename the columns to match the streamgraph requirements
long_data <- long_data %>%
   rename(year = x)

write.csv(long_data, "code-snippets/long_data.csv", row.names = FALSE)

palette = paletteer_d("wesanderson::Royal1", 4)
streamgraph(long_data, key = "name", value = "value", date = "year")