####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por _________________________________________________________________________

# LABORATORIO - RELACIONAMIENTO "CASO HIPOTÉTICO" 

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos
# 2. Calcular co ocurrencias entre personas y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar

#######################################
#LABORATORIO: Relacionamiento (r)     #
#######################################

#---------LABORATORIO NÚMERO 8---------

library (EconGeo)

# 1.Cómo se mide la proximidad (relatedness) para crear el espacio producto
# Material: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

#INSTALACIONES
install.packages ("igraph")
install.packages(“visNetwork”)
install.packages(“htmlwidgets”)
install.packages(“igraph”)
install.packages(“reforma”)
install.packages(“Matrix”)
install.packages(“RSiena”)
install. paquetes(“networkD3”)
install.packages(“curl”)
install.packages(“devtools”)
biblioteca(devtools)
devtools::install_github(“PABalland/EconGeo”, force = T)

#Ya que están instaladas, se corre el comando library
library(EconGeo)

#Importamos una matriz
#Archivo en cvs, separados por comas
#La fila inicial tiene los títulos T (Titles)
#La primera columna tendrá el nombre de las variables
#Se selecciona desde la M hasta los últimos dos paréntesis después del 1
M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

#Para ver la matriz, ejecutar M
M

#En la consola (ventana de abajo) se puede ver la matriz creada
#La primera columna se muestran los nombres de los participantes
#En los renglones se tienen los productos

#Cálculo de co-ocurrencias (cuántos empates de compra entre participantes)
co.occurrence (M)
# co-ocurrencia entre personas/paises/estados

#cálculo de co-ocurrencias de la matriz transpuesta para enfocarse en productos
c = co.occurrence (t(M))
# co-ocurrencia entre productos t es transpuesta

#Para visualizar c
c

# estima el relacionamiento o proximidad pero normalizado, para asegurar que el número de co ocurrencias que observamos
# es mayor al número de co ocurrencias probables (probabilidad condicional)
r = relatedness (c)
#Para estimar el relacionamiento

#Para ver el resultado, corremos r
r
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

#Para poder apreciar el algoritmo de dicho comando, corremos relatedness
relatedness

#Regla para ejecutar el relacionamiento. 
#Si es menor a uno, le corresponde cero. Lo que implica que no haya arista que se ligue al producto
r[r<1] = 0

#Si es mayor a uno, le corresponde uno. Lo que implica que si haya arista que se ligue al producto
r[r>1] = 1


#Para graficar el espacio-producto, se ejecuta la siguiente paquetería:
library (igraph)

#Corremos el comando que tiene como input el relacionamiento calculado anteriormente con la regla binaria de manera no dirigida
g1 = graph_from_adjacency_matrix (r, mode = "undirected")

#Ahora graficamos
plot(g1)
#Se puede apreciar en el cuadrante de visualizaciones (plot)
