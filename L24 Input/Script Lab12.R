####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)

# video 05 - DENSIDAD DEL RELACIONAMIENTO: CASO HIPOTÉTICO 

# Objetivo: Estimar la densidad del relacionamiento (rd)
# La densidad varia entre 0 y 1, los valores más grandes indican que la región ha avanzado a
# una VCR en muchos bienes proximos al bien i y tiene mayor probabilidad de exportarlo en el futuro
# mayor densidad, mayor cercanía. Menor densidad, mayor lejanía.
# --------------------------------------------------------------------------------------------------------------------
# En este laboratorio vamos a:
# 1. Cargar una matriz hipotética de datos
# 2. Estimar la VCR de la matriz hipotética
# 3. Calcular las co-ocurrencias y el relacionamiento (espacio-producto)
# 4. Estimar la densidad del relacionamiento (rd)
#Buscamos saber si las industrias que estan relacionadas estan presentes en las regiones o no. Nivel de cercanía
# 5. Predecir la entrada de una nueva industria
#Econometría usar count(densidad del relacionamiento) como regresora (predictora) de la entrada de una nueva industria

####################################################
# LABORATORIO 5: densidad del relacionamiento (rd) #
####################################################

#----------------------------------LABORATORIO 12--------------------------------
#--------------------------------------------------------------------------------
#Alumna: Ana Grisel Sanjuan Merida

#La densidad del relacionamiento (saber si existe una conexión entre dos productos, qué tan conectado están)
#Mide la distancia en términos de cercanía 
#Mayor densidad evidencia mayor cercanía
#Menor densidad evidencia mayor lejanía

library (EconGeo)

# 1.Cómo se mide la densidad del relacionamiento (rd)?
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

#Preguntaremos a EconGeo, qué es la Ventaja Comparativa Revelada RCA
#Es para saber qué tan especializado está una región en la producción de determinado bien/producto
#Es una medida de especialización
?RCA
#Se visualiza la descripción en el cuadrante inferior derecho (Help)
#Usa la documentación para generar "mat" y crear una matriz con RCA
#copia los datos de las utilidades a la consola ##generate
## generate a region - industry matrix
set.seed(31)
mat <- matrix(sample(0:100,20,replace=T), ncol = 4)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

#Para visualizar la matriz:
mat

#PAra visualizar la dimensión de la matriz generada:
dim(mat)
#En los rengloes están las regiones (5) y en las columnas las industrias (4)

#escribe mat en la consola, son número de empleados
#Ahora, convertimos la matriz en binaria
mat = RCA(mat, binary = T)

#Para visualizar matriz binaria generada
mat
#Los 1 indican la RCA
# ve la nueva matriz binaria de RCA
# Es la matriz de VCR
#correr el RCA de la matriz original (rca básicamente es un indicador de especialización,
#produce mas de lo esperado basado en el tamaño de la región y de la industria)


# calcula la matriz de co-ocurrencia de la mat transpuesta
c = co.occurrence(t(mat))

#Para visualizar la matriz de co-ocurrencias generada
c

# calcula el relacionamiento con base en las co-ocurrencias
r=relatedness(c)

#PAra visualizar
r

#Aplicación de regla binaria
r[r<1]=0
r[r>1]=1
#Es la matriz del espacio-producto

#Para visualizar
r


# Densidad del relacionamiento
# Es la métrica de distancia en términos de cercanía
# Asegurate que hayas computado la matriz binaria de RCA antes de computar el Relacionamiento-densidad
# Se usa la matriz de VCR (mat) Y el espacio producto (r)

#Matriz de VCR
mat

#Matriz del espacio-producto
r

#Las dos matrices serán el INPUT para generar la matriz de relacionamientp
rd=relatedness.density(mat,r)

#Para visualizar
rd

# Rango 0-100
# la industria 1 (I1) esta relacionada con la industria 2 y 3 (I2, I3) (I1)R = 2 (I2;I3)
# Y la región 1 (R1) ya tiene la industria 2 (I2), pero no tiene la industria 3 (I3)
# HAY 2 INDUSTRIAS RELACIONADAS CON LA INDUSTRIA 1, POR ESO 2
# PERO LA REGIÓN 1 SÓLO TIENE 1 DE ESAS INDUSTRIAS RELACIONADAS
# ENTONCES 1/2=0.5

#Para visualizar los datos en forma de lista
rd=get.list(rd)

#Para visualizar
rd
#count se refiere a la variable densidad del relacionamiento
#Es útil para correr ecuaciones de regresión

#para econometría

#Predecir entrada
#En Complejidad Económica se tiene la hipótesis que la densidad del relacionamieto
# es una varibla explicativa para la entrada hacia una industria o no
# 6. Predecir entrada
?entry.list 
#Mira la sección de ejemplos. Copia-pega los datos a la consola
# matrices en 2 momentos en el tiempo

## generate a first region - industry matrix in which cells represent the presence/absence
## of a RCA (period 1)
set.seed(31)
mat1 <- matrix(sample(0:1,20,replace=T), ncol = 4)
rownames(mat1) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat1) <- c ("I1", "I2", "I3", "I4")
#Matriz de la industria región en un momento T

#Para visualizar la matriz 1
mat1
#Matriz binaria de RCA en el momento T

#Nuevamente copiamos el comando de los ejemplos en el cuadrante inferior derecho (help)
## generate a second region - industry matrix in which cells represent the presence/absence
## of a RCA (period 2)
mat2 <- mat1
mat2[3,1] <- 1

#Para visualizar la matriz 2
mat2

#ver que las posibilidades de entrada es cuando tienes un 0 de VCR
#cuando tienes 1 puedes: permanecer o salir, pero no entrar
# NA, no puede entrar (porque ya tiebe una RCA)
# 1 tiene potencial de entrada y entró
# 0 puede tener potencial de entrada, pero no ha entrado
d=entry.list(mat1, mat2)

#Para visualizar d
d
#Ahora se observa una nueva variable: entry (entrada)
#Esta variable la identifica con el juego de la matriz con la matriz T más uno

#Combinación de bases
#PAra ver la densidad del relacionamiento y la tabla recien elaborada
#Se hará un match entre las bases y los elementos región e industria
colnames (d) = c("Region", "Industry", "Entry", "Period")
d = merge(d, rd, by = c("Region", "Industry"))

#Para visualizar objeto d
d

#La variable del relacionamiento trata de explicar por qué las industrias entran o no entran a una determinada región 
#abre d para identificar que se busca explicar que tanto la "densidad del relacionamiento" (x) impacta la entrada (y)
#abre rd que es la "densidad del relacionamiento" como regresora (variable explicativa-x-) de la "entrada" (variable explicada-y-)

#Econometría
#Ecuación de regresión, modelo lineal lm
#La variable dependiente es la entrada ENTRY
#La variable independiente es el relacionamiento COUNT
#Entonces decimos que la entrada va a depender de la densidad del relacionamiento
summary(lm(d$Entry ~ d$Count))
# lm(dependiente~independiente1+independiente2, data=datos)
# que tanto la "densidad del relacionamiento" impacta la entrada



#exportar resultados para cytoscape o gephi
library(igraph)

#Guardar archivo csv
write.csv(d, file = "densidadRelacionamiento.csv")
