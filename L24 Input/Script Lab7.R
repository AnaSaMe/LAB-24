#LABORATORIO NÚMERO 7

# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)
# Alumna: Ana Grisel Sanjuan Merida 

# Laboratorio - Gestión de datos de red - curaduría de datos

# Objetivo: Explorar la organización de los datos
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos
# 2. Transformar la matriz en un dataframe
# 3. Conventir un dataframe en matriz


########################################
# LABORATORIO: Gestión de datos de red #
########################################

#MANUAL ECONGEO PÁGINA 2 PARA INSTALAR ECONGEO
#(ESTA PARTE NO VIENE EN EL TUTORIAL)

install.packages("devtools")
library(devtools)
devtools::install_github("PABalland/EconGeo", force = T)

#INICIO DE LABORATIO 7
# Gestión de datos de red
# 1. Transformar la matriz en un dataframe

# Cargar la librería
library (EconGeo)

#Obtener la matriz
M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

#Para visualizar solo se pone la M
M
#Es una matriz de ventaja comparativa revelada (VCR o RCA)

#ejemplo de una matriz de RCA con personas y productos/ paises y productos-industrias
?RCA
#Se visualiza en la pestaña "Help" de las visulizaciones (es la analítica visual)

#Enlistar las aristas EL (edge list). Es el listado de variables organizados en un dataframe
#Extraer la lista con "get list" de la matriz "M"
#El nombre de las columnas (colnames) son "clientes", "productos" y "contenido de la matriz"
#Generar el dataframe permite hacer estudios estadísticos y econométricos
EL = get.list (M)
colnames (EL) = c("Customer" , "Product" , "Count")

# La forma más usual de encontrar los datos
EL


#Crear matriz mediante MM (será la matriz transformada)
#El input será el listado que se acaba de obtener (el dataframe: la lista)
#Para correrlo, seleccionar desde MM y hasta matriz (la indicación descrita)
MM = get.matrix(EL)
# convertir un dataframe(lista) en matriz

#Para visualizar la matriz transformada que se acaba de creear, corremos MM
MM
#Esta matriz es funcional para operaciones algebráicas


# edge list (lista de aristas(source-target----adyacentes-mis 3 columnas)
EL

# Matriz de adyancencia
get.matrix(EL)

#Buscar Andrea
#En la ventana de Entorno de variables (Environment) damos doble clic en EL para ver la tabla
#En el buscador (donde está la lupa) escribimos Andrea y nos mostrará solo los resultados de ese cliente
#Esta es una manera de filtrar la información

#Otra manera es generar un objeto x que sea una subtabla que contenga
# el dataframe del producto denominado corbata "Tie"
x = subset (EL, Product =="Tie")

#Para sisualizarlo el comando es x
x
#Se ven todos los clientes pero solo el producto seleccionado
