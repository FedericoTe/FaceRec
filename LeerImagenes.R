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

# Directorio de trabajo
setwd("~/Personal/GITHUB//FaceRec/")

# Cargar los dos data frame 
# Para las imagenes solo, comentar las dos lineas siguientes
Train <- read.csv("../DATA_FaceRec//Data/training.csv",stringsAsFactors=F)
Test <- read.csv("./Data//test.csv")

# 
# La ultima columna de Train es una imagen, seleccionamos una con num_imagen <- NUMERO
# y la grabamos aparte, separando cada texto en números enteros
#

num_imagen <- 2

Imagen_Train <- as.integer(unlist(strsplit(Train$Image[num_imagen], " ")))

# Para convertirlas en imagenes debemos crear una matriz de 96 * 96 y previamente tenemos que revertir la matriz, poner el primer número al final, el segundo el penúltimo,... y

m <- matrix(rev(Imagen_Train),96,96)

# Para ver las imagenes una a una elegimos el numero de imagen y la ponemos en blanco y negro


image(1:96,1:96,m,col=gray((0:255)/255))

# Podemos ahora marcar los puntos de esta imagen con un bucle for:
#
#for (i in seq(from = 1, to = (ncol(Train)-2) ,by =2)){
#  points(96-Train[1,i],96-Train[1,i+1], col = "green", pch = 19)
#}
#
# O bien con las funciones apply aplicadas a los indices:

indice <- seq(from = 1, to = (ncol(Train)-2) ,by =2)
lapply(indice, function(x,y) points(96-y[num_imagen,x],96-y[num_imagen,x+1], col = "blue", pch = 19), y=Train )



