

library(ggstream)
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

# plot
ggplot(long_data, aes(x = year, y = value, fill = name)) +
   geom_stream(color = "black") +
   scale_fill_paletteer_d("lisa::FridaKahlo") +
   theme_minimal() +
   theme(legend.position = "none") +
   labs(title = "Streamgraph of the datastream dataset", x = "Year", y = "Value") +
   theme(plot.title = element_text(hjust = 0.5))
