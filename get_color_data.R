rm(list=ls())
library(tidyverse)
library(paletteer)
source("utils.R")

df = list(palettes_d_names, palettes_c_names) %>%
  set_names(c("paletteer_d", "paletteer_c")) %>%
  bind_rows(.id = "pal_function") %>%
  as_tibble()

df$creatorName <- NA
df$maintainerName <- NA
df$projectUrl <- NA
df$description <- NA
df$colors <- NA

verbose <- TRUE
for(i in 1:nrow(df)) {
    package_name <- df$package[i]
    package_info <- get_package_info(package_name)
    df$creatorName[i] <- package_info$creatorName
    df$maintainerName[i] <- package_info$maintainerName
    df$projectUrl[i] <- package_info$projectUrl
    df$description[i] <- package_info$description
    colors = get_palette_colors(package_name, df$palette[i], type = df$pal_function[i])
    colors_chr = as.character(paste0(colors, collapse = ", "))
    df$colors[i] <- colors_chr
    
    if (verbose){
        print(df$palette[i])
        print(colors)
        cat('---\n\n')
    }
}

# save
write_csv(df, "palette_properties.csv")
df = read_csv("palette_properties.csv")

