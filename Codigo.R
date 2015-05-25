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
# La ultima columna de Train es una imagen, la grabamos aparte, separando cada texto en números enteros
#

Imagenes_Train_1 <- as.integer(unlist(strsplit(Train$Image[1], " ")))

# Para convertirlas en imagenes debemos crear una matriz de 96 * 96 y previamente tenemos que revertir la matriz, poner el primer número al final, el segundo el penúltimo,... y

m <- matrix(rev(Imagenes_Train_1),96,96)

# Para ver las imagenes una a una  la ponemos en blanco y negro

image(1:96,1:96,m,col=gray((0:255)/255))

# Podemos ahora marcar los puntos de esta imagen con:

for (i in 1:(ncol(Train)-2)){
  points(96-Train[1,i],96-Train[1,i+1], col = "blue", pch = 19)
  i <- i+1
}




