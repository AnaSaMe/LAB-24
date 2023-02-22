####################################################################
#Laboratorio - Análisis de Redes en R - Indicadores básicos globales

#-----------------LABORATORIO 16--------------------#
#---------------------------------------------------#
#Alumna: Ana Grisel Sanjuan Merida

library(EconGeo)

#Cargamos nuestra Data
#Es una lista de aristas, por ello se llama EL
#Interacciones de los personajes de Los Miserables
#EL = read.csv("https://raw.githubusercontent.com/PABalland/ON/master/lesmis-el.csv")

#Ver encabezado
head(EL)

#Transformar dataframe a matriz de adyacencias
MM <- get.matrix(EL)
#Es una red no dirigida porque la matriz de adyacencias es simétrica

#Twitter es un ejemplo de red dirigida porque puedo estar siguiendo a tal persona
# pero ella no me sigue

#Facebook es un ejemplo de red NO dirigida porque al enviar una solicitud de amsitad
# dicha persona aceptará y seremos amigas ambas (es bidireccional)

#Grafiquemos
#Llamamos a la librería
library(igraph)

#Llamamos al objeto gráfico g
#Con una gráfica que provenga del dataframe y los datos de EL
#La red no es dirigida (es bidireccional) por lo que directed=FALSE
g <- graph_from_data_frame(d=EL, directed = FALSE)

#Para visualizar objeto gráfico g
g

#Para generar el plot
plot(g)

#Interacciones entre personajes sin considerar el peso
#solo identificar quién se relaciona con quién
EL$Weight = NULL

#Para visualizar
head(EL)
#Aparece el listado sin el peso, solo su interacción

#Instalamos netword3
install.packages("networkD3")

#Llamamos a la librería
library(networkD3)

##Visualización que busca la estructura/layout más adecuada dependiendo los datos
simpleNetwork(EL)

#-----------------FIN DE LABORATORIO 16----------------------#
