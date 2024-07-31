install.packages(c("tidyverse","tidytext","ggraph","stylo","RCurl","ggplot"))
getwd()
library("readr")
url<- "https://raw.githubusercontent.com/rominicky/materiales/main/assets/Provincias.csv"
destino <- "./provincias.csv"
download.file(url, destino)
provincias <- read_csv(destino)
library(tidyverse)
provincias <- read.csv('./Provincias.csv')
View(provincias)
library(tidyverse)
ggplot(provincias, aes(x = reorder(Nombre.de.provincia, Viviendas.particulares..2022.), y = Viviendas.particulares..2022.)) + #indicamos que datos asignamos a cada eje
  geom_bar(stat = "identity", na.rm = TRUE)
  coord_flip() +  
  labs(title = "Vivienda colectiva por Provincias argentinas",
       x = "Provincias",
       y = "Vivienda colectiva") +
  theme_light()
