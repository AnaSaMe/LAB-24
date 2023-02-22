
####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)


# LABORATORIO - Gráficos en R con ggplot2 

#------------------LABORATORIO 13---------------------------------
#-----------------------------------------------------------------
#Alumna: Ana Grisel Sanjuan Merida


# Instalar primero las paqueterías necesarias
install.packages("tidyverse")
install.packages("readr")
install.packages("ggplot2")
install.packages("psych")
install.packages("ggcorrplot")
install.packages("ggpubr")
install.packages("gridExtra")


# cargar libreria ggplot2
library(ggplot2)

#Cargar los datos
#Cuadrante inferior derecho/Upload allí ser carga
#El de REGESIONES FINALES.csv
#El de correl.csv

# leer df
green_data <- read.csv("REGESIONES FINALES.csv")
#Está en el Environment

# echando un ojo a los datos
names(green_data)
#Se muestran varios indicadores

#Graficar la relación que existe ente los diversos indicadores pariados

#Relación entre los índices ICE y GCI
#Con la función de ggplot, cargando los datos que proveninen de green_data
# y que los vaya dibujando con mapping
# siendo los elementos estéticos aes:
# en el eje de las x, el índice de complejidad económica ICE_index
# en el eje de las y, el índice de complejidad verde GCI_index
#Será un gráfico de puntos con geom_pooint
# e incluirá texto con geom_text
# ambos provenientes de la base de datos green_data
# y las etiquetas estarán representadas por Estados STATE
# siendo elementos adicionales el color y el tamaño
#Inclurá una línea de regresión con lineal method lm
# omitiendo el error estandar se=FALSE
p1 <- ggplot(data = green_data,
             mapping = aes (x = ICE_index,
                            y = GCI_index)) +
  geom_point() +
  geom_text(label = green_data$STATE,
            color = "black" ,
            size = 4) +
  geom_point() +
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

#Para visualizar el objeto p1
p1

#Relación entre los ranking ICE y el GCI
p2 <- ggplot(data = green_data,
              mapping = aes (x = ICE_rank,
                             y = GCI_rank)) +
  geom_point() +
  geom_text(label = green_data$STATE,
            color = "black" ,
            size = 4) +
  geom_point() +
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

#Para visualizar el objeto p2
p2

#Relación entre el Producto Interno Bruto por Estado LPIBE y 
# el Índice de Complejidad Verde GCI_index
p3 <- ggplot(data = green_data,
             mapping = aes (x = LPIBE,
                            y = GCI_index)) +
  geom_point() +
  geom_text(label = green_data$STATE,
            color = "black" ,
            size = 4) +
  geom_point() +
  geom_smooth(method = lm,
              se = FALSE,
              fullrange = TRUE)

#Para visualizar p3
p3


#CONOCER LAS CORRELACIONES
### correl1
install.packages("psych")
library(psych)

#Abriremos un dataframe llamado correl
# indicar que lea la base de datos correl.csv
library(readr)
correl <- read_csv("correl.csv")
#Las variables que se pueden apreciar son GCI_rank, ICE_rank, GCI_index y LPIBE
# se visualiza en el Environment dando clic en correl

#Cada una de las variables se van a correlacionar
#Indicar que las variables se correlacionen de forma pariada
attach(correl)
names(correl)

#Gráfico de correlación
pairs(correl)

#Gráfico de correlación en panel
pairs.panels(correl)


### correl2

# Calculamos la correlación de complejidad
# Generamos dataframe llamado complex_corr
# el signo de asignación al presionar Alt- y aparece así: <- 
# obtener correlación del archivo correl
# mediante el método de Pearson
complex_corr <- cor(correl, method = "pearson")

#Para visualizar complex_corr
complex_corr
#En la consola se ven los resultados en forma de matriz (o sea la matriz de correlación)

# Redondeamos el coeficiente de correlación
# Nombramos la base de datos
# redondeamos con round a dos dígitos
complex_corr = round(complex_corr, digits = 2)

#Para visualizar
complex_corr
#En la consola se aprecia la matriz redondeada

#Mapa de calor de las correlaciones
#matriz de correlación
install.packages("ggcorrplot")
library(ggcorrplot)
library(ggplot2)

#Generamos objeto llamado p4
#ggcorrplot los dibujará
#Los input serán el complex_corr (la matriz recien generada)
#El método (method) será en círculos 
#El type será lower porque solo queremos ver la matriz superior izquierda
#El título será Matriz de correlación
#El tema será minimalista (theme minimal)
p4 <- ggcorrplot(complex_corr, method = "circle", type = "lower", lab = TRUE) +
  ggtitle("Matriz de correlación") +
  theme_minimal()

#Para visualizar p4
p4

#Entre más rojo está el dato, la correlación es lineal apreciable
#Entre más azul está el dato, la correlación es inversa aprecibale

#Conjunto de gráficos dentro de una sola cuadrícula
#####
install.packages("ggpubr")

#Llamamos a la librería
require(ggpubr)

#Con ggpur se hará la unión (ggarrange) entre los objetos obtenidos (p1, p2, p3 y p4)
ggpubr :: ggarrange (p1, p2, p3, p4, etiquetas = c ("A", "B", "C" , "D"))

#Conjunto de gráficos dentro de una sola cuadrícula en dos renglones para una mayor estética
#####

library(ggplot2)
install.packages("gridExtra")

#Llamamos a la libreria de gridExtra
require(gridExtra)

#Hacemos un objeto gráfico llamado F1
#Será un grid (es decir, una rejilla de unión: grid.arrange)
#Los gráficos anteriores (p1, p2, p3 y p4) 
#Estarán acomodados en dos renglones nrom = 2
F1 <- grid.arrange (p1, p2, p3, p4, nrow = 2)

#--------------------------FIN DE LABORATORIO 13-------------------#