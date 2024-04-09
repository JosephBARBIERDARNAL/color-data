library(paletteer)
library(tidyverse)

# scatter plot
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point() +
  scale_color_paletteer_d("futurevisions::atomic_blue") +
  theme_minimal()

# bar plot
n = 5
set.seed(1)
data = data.frame(x = 1:n, y = rnorm(mean=100, sd=50, n=n), group = LETTERS[1:n])
ggplot(data, aes(x, y, fill = group)) +
  geom_bar(stat = "identity") +
  scale_fill_paletteer_d("lisa::FridaKahlo") +
  theme_minimal()

# heatmap
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)
ggplot(data, aes(X, Y, fill= Z)) + 
    geom_tile() +
    scale_fill_paletteer_c("ggthemes::Sunset-Sunrise Diverging") +
    theme(axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank())+
    theme(panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank()) +
    theme(legend.position = "none") +
    theme(axis.ticks = element_blank())

# multiple line plot (generate 5 random walks)
n = 40
sd = 5
rw1 = cumsum(rnorm(n, sd=sd))
rw2 = cumsum(rnorm(n, sd=sd))
rw3 = cumsum(rnorm(n, sd=sd))
rw4 = cumsum(rnorm(n, sd=sd))
rw5 = cumsum(rnorm(n, sd=sd))
data = data.frame(x = 1:n, y = rw1, group = "A")
data = rbind(data, data.frame(x = 1:n, y = rw2, group = "B"))
data = rbind(data, data.frame(x = 1:n, y = rw3, group = "C"))
data = rbind(data, data.frame(x = 1:n, y = rw4, group = "D"))
data = rbind(data, data.frame(x = 1:n, y = rw5, group = "E"))
ggplot(data, aes(x, y, color = group)) +
  geom_line(size=0.8) +
  scale_color_paletteer_d("lisa::OskarSchlemmer") +
  theme_minimal()