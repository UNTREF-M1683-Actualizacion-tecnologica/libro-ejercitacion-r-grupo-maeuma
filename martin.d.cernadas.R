# cargamos las provincias desde archivo externo CSV, presente en este mismo repo
provincias <- read.csv('./Provincias.csv') 

# cargamos la libreria TIDYVERSE para manipular datos, previa instalacion
# install.packages("tidyverse")
library(tidyverse) 
provincias <- provincias %>%
  rename(variacion = Variación.de.población..2010.a.2022.)

# calculamos la media de personas en situación de calle por provincia
media_variacion <- provincias %>%
  group_by(Nombre.de.provincia) %>% #Agrupamos los datos por la columna Nombre.de.provincia.
  #summarise(media_variacion = mean(variacion, na.rm = TRUE)) #Calculamos la media de la columna variacion-2010-2022 por cada provincia agrupada, generamos una nueva columna
  summarise(variacion, na.rm = TRUE) #Calculamos la media de la columna variacion-2010-2022 por cada provincia agrupada, generamos una nueva columna


# instalamos paquete GGPLOT
# install.packages("ggplot2")
library(ggplot2) 

# gráfico comparativo
ggplot(provincias, aes(x = Nombre.de.provincia, y = variacion, fill = variacion)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  scale_fill_viridis_c() +  # Usaremos una paleta con colores contrastantes
  labs(title = "Comparación de Variacion de Población 2022-2010",
       x = "Provincia",
       y = "Población 2022",
       fill = "Variación de Población 2010-2022") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotamos a 45º las etiquetas del eje x
