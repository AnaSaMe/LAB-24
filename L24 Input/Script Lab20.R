####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)


# LABORATORIO - Gráficos en R con ggplot2 
# faceting (romper un gráfica en varias dentro de una cuadrícula)


#----------------------LABORATORIO 20----------------------------
#----------------------------------------------------------------
#----------Alumna: Ana Grisel Sanjuan Merida---------------------


#instalando paquete 
install.packages("ggplot2")

# cargar libreria ggplot2 
library(ggplot2)

#buscar df
file.choose()

#Leer base al crear un data frame
# Recibirá el nombre de densidad_verde
#Se coloca signo de asignación (teclear: alt -)
#Añadimos read.csv
#Dentro del paréntesis colocamos la ruta (de comillas a comillas) del archivo recien seleccionado
densidad_verde <- read.csv("C:\\Users\\Lenovo\\Documents\\GitHub\\LAB-20\\L20 Input\\PARA FACETING.csv")

#ver nombres
#Anotamos names
#Dentro del paréntesis, colocar el nombre del data frame creado
names(densidad_verde)


#¿Cuáles son las dos variables para hacer el faceting?
#En el eje de las X estará la densidad del relacionamiento verde
#En el eje de las Y estará el Índice de Complejidad del Producto PCI

#Colocando grafica base
#Se crea el objeto p
#Llamaremos a la librería de ggplot
#Los datos (data) se toman del data frame llamado densidad_verde
#Hacer mapeo (mapping) que genere elementos estéticos (aes)
#En el eje de las X irá la DENSITY
#En el eje de las Y irá el PCO.2018
#Que se coloree por Region
p <- ggplot(data = densidad_verde,
            mapping = aes(x=DENSITY,
                          y=PCI.2018,
                          color=Region))+
  geom_point()


# manipulando número de columnas
p+facet_wrap(~Region, ncol=5)

# facet_wrap (recomendado con una variable)
p+facet_wrap(~Region)

# manipulando número de filas
p+facet_wrap(~Region, nrow=3)


