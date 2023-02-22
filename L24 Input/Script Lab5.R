#LABORATORIO 5

#Instalar paquete tidyverse y readr
install.packages("tidyverse")
install.packages("readr")

#Cargar paquete tidyverse y readr
library(tidyverse)
library(readr)

#CARGAR DATOS

#En la ventana de Data (al frente) damos clic en Import Dataset y buscamos
#la ubicación del archivo que generamos, el ICE 2014 en csv
#se puede importar desde la ventana que se abrió
#También, en la parte inferior se mostrará el código
#lo copiamos y pegamos aquí para correrlo pero antes sustituimos lo que dice
# ICE_2014 por tabla1

#Este es el código original obtenido
library(readr)
ICE_2014 <- read_csv("Doctorado ICEA/Asignaturas/3er Semestre/TemasSelectos1 ComplejidadEconómica/Labs/Lab 5/L5 Input/ICE 2014.csv")
View(ICE_2014)

#Este es el código modificado que se correrá
tabla1 <- read_csv("Doctorado ICEA/Asignaturas/3er Semestre/TemasSelectos1 ComplejidadEconómica/Labs/Lab 5/L5 Input/ICE 2014.csv")

#para ver los nombres de la tabla
names(tabla1)


#INSTRUCCIONES

#Se tiene una matriz ordenada a lo ancho

#1. Se requiere pivotar la tabla "a lo largo"
#Generar tabla que se llama ti_PIVOTANTE 
#Como input debe tener la tabla1 que se acaba de cargar
#colocar operador pip %>% (que es un filtro)
#Entonces se pivotea a lo largo las columnas de Km
#Se llamará iteración y su valor será el ranking
t1_PIVOTANTE = tabla1 %>%
  pivot_longer(cols = c("Km,0" , "Km,2" , "Km,4" , "Km,6" , "Km,8" , "Km,10" , "Km,12" , "Km,14" , "Km,16" , "Km,18" , "Km,20" , "Km,22" , "Km,24" , "Km,26" ),names_to = "iteracion", values_to = "ranking")

#Ahora se va a exportar
#En formato separado por comas csv
#El input será la tabla pivotante t1_PIVOTANTE que se acaba de generar
#El archivo se llamará ice_CHARTICULATOR.csv
write.csv(t1_PIVOTANTE, file = "ice_CHARTICULATOR.CSV")

#Para saber en qué ruta se guardó ejecuto el comando
getwd()
#Está en los documentos
