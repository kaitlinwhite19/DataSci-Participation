#install.packages("tidyverse")
#install.packages("scales")
#install.packages("tsibble")

suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(gapminder))
suppressPackageStartupMessages(library(scales))
knitr::opts_chunk$set(fig.width = 5, fig.height = 4, fig.align = "center")

ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(alpha = 0.1) +
  scale_x_log10("GDP per capita", labels = scales::dollar_format()) +
  theme_bw() +
  ylab("Life Expectancy")

