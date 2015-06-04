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
#
####################################

# Cargamos las imagenes que ya guardamos en LeerImagenes.R

Todas_Imagenes <- readRDS("DATA/Imagenes.saved")

# Seleccionamos el parche dando los valores X e Y de la esquina superior derecha y los dos desplazamientos Delta_X y Delta_Y

X_Origen <- 15
Y_Origen <- 45
X_Delta <- 30
Y_Delta <- 30

# Seleccionamos una imagen de las 7049 imagenes totales

Seleccion_Imagen <- 1

# Seleccionamos el parche

parche <- Todas_Imagenes[[Seleccion_Imagen]][X_Origen:(X_Origen+X_Delta),Y_Origen:(Y_Origen+Y_Delta)]

# Podemos ver el parche con:

image(X_Origen:(X_Origen+X_Delta),Y_Origen:(Y_Origen+Y_Delta),parche,col=gray((0:255)/255))
