####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

# T1_04_REDES COMPLEJAS(1) - Visión de redes complejas - parte 1
#para dibujar el espacio-producto
#Hace uso de datos complejos (matrices muy amplias con más de 100 nodos)

# Objetivo: Estimar el Maximum Spanning Tree -árbol de expansión máxima- (asegurar una visión clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder v. redes complejas

### REGLAS DE ACCIÓN ###
# Regla 1: mantener n-1 conexiones como máximo
# es decir, si tenemos 200 nodos, las conexiones serán 199
# Regla 2: Quitar las conexiones con el peso más bajo, nos vamos quedar con las del peso máximo (menos conexiones)
# por lo que se limpiarán los nodos, dando prioridad a los nodos con muchas más conexiones (aristas adyacentes al nodo)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Usar un matriz hipotetica de datos
# 2. Graficar sus próximos adyacentes


#---------------------------LABORATORIO 10-------------------------
#------------------------------------------------------------------
#Alumna: Ana Grisel Sanjuan Merida


##################################################################
# practica 3: Visión clara del espacio-producto: CASO HIPOTÉTICO #
##################################################################

#¿Cómo crear una visión clara del espacio-producto: árbol de expansión máxima (MST)
#Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Paper in Evolution

# 1)la visualización del espacio - producto sea una red conectada: evitar islas de productos aislados. 
# 2)PROBLEMA: tratar de visualizar demasiados enlaces puede crear una complejidad visual innecesaria 
# donde se obstruirán las conexiones más relevantes.
#calculamos el árbol de expansión máxima (MST) de la matriz de proximidad. 
# MST es el conjunto de enlaces que conecta todos los nodos de la red utilizando un número mínimo de conexiones
# y la suma máxima posible de proximidades. 
#Calculamos el MST usando el algoritmo de Kruskal: Básicamente, el algoritmo clasifica los valores de la matriz
# de proximidad en orden descendente y luego incluye enlaces en el MST si y solo si conectan un producto aislado. 
#Por definición, el MST incluye todos los productos, pero el número de enlaces es el mínimo posible.
#Después de seleccionar los enlaces utilizando los criterios mencionados anteriormente, 
# construimos una visualización utilizando un algoritmo de diseño dirigido por la fuerza. 


#crear una matriz aleatoria de 200*200
M <- matrix(runif(200*200, min=0, max=100), ncol=200)
diag(M) <- 0
head (M[,1:6])
dim (M)
#Es una matriz con datos aleatorios
#200 columnas y 200 renglones

#Para graficar
library (igraph)


#grafica la matriz de adyacencias
#Crear objeto llamado g, que es la gráfica de adyaniencia
#El input es la matriz que se acaba de generar
#Es una red no dirigida y el peso es una variable a tomar en cuenta
g <- graph.adjacency(M, mode="undirected" , weighted = TRUE)
plot (g)
#El plot tiene muchas aristas y es difícil de interpretar


#Aplicación de la función Árbol de Expansión Máxima
# para asegurar que las tres reglas se cumplan
#Se multiplica la matriz original por -1 para hacerla negativa e identificar los máximos
M <- -M
head (M[,1:6])
#Se aprecia en el Environment
#En la paquetería de igraph se tiene la función de calcular el ärbol de expansión mínima
# por lo que hacerla negativa me permite obtener el Árbol de Expansión Máxima
#Transforma la matriz en en NEGATIVA y para identificar los máximos

#Graficar
#grafica nueva con matriz negativa, ver el espacio-producto, tecnológico 
g <- graph.adjacency(M, mode="undirected" , weighted = TRUE)

#Calcular árbol de expansión mínima
MST <- minimum.spanning.tree(g)

#Graficar lo que se acaba de hacer
plot (MST, vertex.shape="none", vertex.label.cex=.7)


# matriz de adyacencias (nuevo relacionamiento)
A <- get.adjacency(MST, sparse = F)

# ver las aristas que hay entre los nodos
head(A)

#Exportar 
#VER LAS ARISTAS(PESOS)
#nodos n-1
write.graph(MST,file="g.gml", format="gml")
#Formato legible para cualquier paquetería especializada
#Se guarda en la carpeta específica

#Exportar resultados para cytoscape o gephi
write.csv(A, file="Adyacentes.csv")
