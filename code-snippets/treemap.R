library(tidyverse)
library(treemap)
library(ggfittext)
library(scales)
library(ggtext)

artwork <- readr::read_csv(
   "https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/artwork.csv",
   show_col_types = FALSE
)
artists <- readr::read_csv(
   "https://raw.githubusercontent.com/holtzy/R-graph-gallery/master/DATA/artist_data.csv",
   show_col_types = FALSE
)

artwork_artist <- artwork %>%
   left_join(artists, by = c("artistId" = "id")) %>%
   mutate(
      gender = case_when(
         str_detect(artist, "British") ~ "Other",
         str_detect(artist, "Art & Language") ~ "Male",
         TRUE ~ gender
      ),
      artist = case_when(
         str_detect(artist, "British") ~ "British School",
         TRUE ~ artist
      )
   ) %>%
   filter(!is.na(gender)) %>%
   group_by(artist, gender) %>%
   summarise(total = n()) %>%
   # filter(name != "Turner, Joseph Mallord William") %>%
   ungroup() %>%
   mutate(id_tree = row_number())

data_ggplot <- data_tree[["tm"]] %>%
   as_tibble() %>%
   arrange(desc(vSize)) %>%
   mutate(
      rank = row_number(),
      xmax = x0 + w,
      ymax = y0 + h,
      label_artist = str_glue("{artist}\n({comma(vSize, accuracy = 1)})")
   )

df <- read_csv("https://raw.githubusercontent.com/holtzy/The-Python-Graph-Gallery/master/static/data/simple-treemap.csv")

ggplot(df) +
   geom_rect(
      aes(
         xmin = x0,
         ymin = y0,
         xmax = xmax,
         ymax = ymax,
         fill = vColor
      ),
      size = 0.1,
      colour = "#1E1D23",
      alpha = 0.9
   )