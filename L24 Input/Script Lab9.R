####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

#------------------ LABORATORIO 9 -------------------------
#----------------------------------------------------------
# Alumna: Ana Grisel Sanjuan Merida


# T1_03_ESPACIO PRODUCTO(2) - RELACIONAMIENTO "CASO REAL": EXPORTACIONES HIDALGUENSES

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz de datos
# 2. Calcular co ocurrencias entre lugares y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar
# 5. Exportar los resultados para trabajarlos con cytoscape o gephi

#######################################
# practica 2: exportaciones hidalguenses #
#######################################

#Primero ser carga EconGeo
library (EconGeo)

#Se carga el archivo csv en el cuadrante de Envitoment/Importar database/FromText(base))
#seleccionar archivo desde la ruta de su ordenador
#Una vez cargada, de la consola copiamos el enlace de ubicación del archivo csv (lo que quedó entre comillas)
#Damos la indicación de leer la matriz M
#definida en formato csv
#y que R la importó como "~/Doctorado ICEA/Asignaturas/3er Semestre/TemasSelectos1 ComplejidadEconómica/Labs/Lab 9/L9 Input/rca_2014.csv"

M = as.matrix(
  read.csv("~/Doctorado ICEA/Asignaturas/3er Semestre/TemasSelectos1 ComplejidadEconómica/Labs/Lab 9/L9 Input/rca_2014.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
#Se puede apreciar en el cuadrante de Enviroment

#Para visualizar los primeros diez datos de la matriz
head (M[,1:10])
dim (M)
#Se muestran los primero diez datos de la matriz que está conformada por 83 renglones y 429 columnas

#Cálculo de co-ocurrencia entre personas/paises/estados
co.occurrence(M)

#Cálculo co-ocurrencia entre productos t es transpuesta
c = co.occurrence(t(M))

#Para visualizarla
c

#Cálculo del relacionamiento o proximidad
r = relatedness(c)

#Para visualizar 
r

# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

#Transformar matriz de relacionamiento en una matriz binaria
#opcional (sólo para trabajar con datos binarios)
r[r<1] = 0
r[r>1] = 1

#Para visualizar
r

#Generación de gráfica
library (igraph)
g1 = graph_from_adjacency_matrix(r, mode = "undirected")
plot(g1)


#Exportar resultados

#exportar resultados del relacionamiento binario
write.csv(r, file="relatedness.csv")

#exportar resultados de co ocurrencias
write.csv(c, file="cocurrences.csv")

#Ya que exportamos los resultados, se pueden trabajar con cytoscape o gephi
