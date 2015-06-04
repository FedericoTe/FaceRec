########################################################
#
#  Competicion de Kaggle.com  Reconocimiento Facial
#
#   Mas en: https://www.kaggle.com/c/facial-keypoints-detection
#
#   AUTOR: Federico Tejeiro
#   Contacto:  ftejeiro@gmail.com
#
#######################################################

#####################################
#
#  Fichero para ver parches de las imagenes
#   Se supone que ya tiene en memoria el fichero Train
#
####################################

# Cargamos las imagenes que ya guardamos en LeerImagenes.R

Todas_Imagenes <- readRDS("DATA/Imagenes.saved")

# Seleccionamos el parche dando los valores X e Y de la esquina superior derecha y los dos desplazamientos Delta_X y Delta_Y

X_Origen <- 25
Y_Origen <- 50
X_Delta <- 10
Y_Delta <- 15

# Seleccionamos una imagen de las 7049 imagenes totales

Seleccion_Imagen <- 1890

# Seleccionamos el parche

parche <- Todas_Imagenes[[Seleccion_Imagen]][X_Origen:(X_Origen+X_Delta),Y_Origen:(Y_Origen+Y_Delta)]

# Podemos ver el parche con:

image(X_Origen:(X_Origen+X_Delta),Y_Origen:(Y_Origen+Y_Delta),parche,col=gray((0:255)/255))


###########################
#  ERRORES A PARTIR DE AQUI
#
#########################333



# Podemos marcar el punto de esa imagen sabiendo la columna, en este caso las coordenadas del ojo iquierdo, extraídas con colnames(Train) mediante la función point:

X_Punto <-  1  # left_eye_center_x
Y_Punto <- 2  # left_eye_center_y

# points(((96-Train[Seleccion_Imagen,X_Punto])-X_Origen+1),((96-Train[Seleccion_Imagen,Y_Punto])-Y_Origen+1), col="red",pch=19)

points((96-Train[Seleccion_Imagen,X_Punto]+1),(96-Train[Seleccion_Imagen,Y_Punto]+1), col="red",pch=19)

# y la intensidad de ese punto es:

parche[round((96-Train[Seleccion_Imagen,X_Punto])-X_Origen+1,digits = 0),round((96-Train[Seleccion_Imagen,Y_Punto])-Y_Origen+1, digits = 0)]

# que coincide con:

Todas_Imagenes[[Seleccion_Imagen]][96-Train[Seleccion_Imagen,X_Punto],96-Train[Seleccion_Imagen,Y_Punto]]


# Podemos ver los valores de parche con:

View(t(parche))

###################################3
#
#  ¿¿¿Es la intensidad del centro de todos los ojos el menor valor en la matriz parche con las dimensiones
#  X_Origen <- 25
#  Y_Origen <- 50
#  X_Delta <- 10
#  Y_Delta <- 15
#
#################################3
#
# El valor del mínimo de la matriz parche sale, en coordenadas de parche
# con el resto o modulo y la división entera:
# Es decir:
#

Y_min <- which.min(parche)%/%X_Delta
X_min <- which.min(parche)%%X_Delta

# Y la posicion sería, creo,

points(X_min + X_Origen -1, Y_min + Y_Origen-1, col=red, pch=1)
