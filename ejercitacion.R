# cargamos las provincias desde archivo externo CSV, presente en este mismo repo
provincias <- read.csv('./Provincias.csv') 

# cargamos la libreria TIDYVERSE para manipular datos, previa instalacion
install.packages("tidyverse")
library(tidyverse) 
provincias <- provincias %>%
  rename(situacion_calle = Personas.en.situación.de.calle..vía.pública.)

# calculamos la media de personas en situación de calle por provincia
media_situacion_calle <- provincias %>%
  group_by(Nombre.de.provincia) %>% #Agrupamos los datos por la columna Nombre.de.provincia.
  summarise(media_situacion_calle = mean(situacion_calle, na.rm = TRUE)) #Calculamos la media de la columna situacion_calle por cada provincia agrupada, generamos una nueva columna 'media_situacion_calle'

# instalamos paquete GGPLOT
install.packages("ggplot")
library(ggplot) 

# gráfico comparativo
ggplot(provincias, aes(x = Nombre.de.provincia, y = Población..2022., fill = situacion_calle)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  scale_fill_viridis_c() +  # Usaremos una paleta con colores contrastantes
  labs(title = "Comparación de Población 2022 y personas en situación de calle por provincia",
       x = "Provincia",
       y = "Población 2022",
       fill = "Personas en situación de calle") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotamos a 45º las etiquetas del eje x
