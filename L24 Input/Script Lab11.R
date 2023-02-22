####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

##########################################################################################
# LABORATORIO 4: Visión clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -Árbol de expansión máxima- (asegurar una visión clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como máximo
# Regla 2: Quitar las conexiones con el peso más bajo, nos vamos quedar con las del peso máximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------
#En este ejercicio vamos a:
#1. Usar una matríz de datos que contiene el relacionamiento de las exportaciones hidalguenses
#2. Graficar sus próximos adyacentes



#----------------------------LABORATORIO 11------------------------------------------------
#------------------------------------------------------------------------------------------
#Alumna: Ana Grisel Sanjuan Merida

# 1.Cómo crear una Visión clara del espacio-producto: árbol de expansión máxima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

# 1. Cargar la matriz de proximidades (Relatedness) "CASO ESPACIO-PRODUCTO DE EXPORTACIONES HIDALGUENSES"
# 2. Estimar el árbol de expansión máixma (MST)
# 3. Graficar

#cargar paquete
library(EconGeo)


#Importar matriz "relatednessbinario.csv"
# ubicar archivo
file.choose()
#Abre ventana y selecciono el archivo

#Copio la ubicación desde la consola (cuadrante inferior)
# desde donde inician las comillas hasta donde terminan

#Se copia en este comando
#Se genera mariz
M = as.matrix(
  read.csv("C:\\Users\\Lenovo\\Documents\\GitHub\\LAB-11\\L11 Input\\relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
#En en panel de objetos (Environmet) se muestra el objeto M que es la matriz compleja

#Para visualizar diez datos de la matriz
head (M[,1:10])
dim (M)
#Son 429 renglones y 429 columnas
#Es la matriz binaria de relacionamiento (Matriz del espacio-producto)


#Gráficas
library (igraph)

#Graficar adyacencias
red_hidalgo1 <- graph.adjacency(M, mode = "undirected" , weighted = TRUE)
plot(red_hidalgo1)
#grafica la matriz de proximidades natural


#Árbol de expansión Máxima
#Transforma la matriz en en NEGATIVA y para identificar los máximos
M <- -M
head(M[,1:6])

#grafica la nueva matriz negativa con MST
#con el input de la matriz en negativo que se acaba de generar
red_hidalgo2 <- graph.adjacency(M, mode = "undirected" , weighted = TRUE)
MST <- minimum.spanning.tree(red_hidalgo2)
plot(MST, vertex.shapes="none", vertex.label.cex=.7)

#Exportar red en formato gml
write.graph(MST,file = "redhidalgo2.gml", format = "gml")
#nodos n-1

# matriz de proximos adyaentes (nuevo relacionamiento)
A <- get.adjacency(MST, sparse = F)

#exportar matriz de proximos adyacentes
write.csv(A, file = "AdyacebtesConMST.csv")

