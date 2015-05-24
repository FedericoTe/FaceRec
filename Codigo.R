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
Train <- read.csv("../FaceRep_Manual/Data//training.csv",stringsAsFactors=F))
Test <- read.csv("./Data//test.csv")

# 
# La ultima columna de Train es una imagen, la grabamos aparte, separando cada texto en números enteros
# Para grabar solo las imagenes descometnar la siguiente linea
# Train_Images <- read.csv("../FaceRep_Manual/Data//Imagenes.RData",stringsAsFactors=F))
Imagenes_Train <- as.integer(unlist(strsplit(Train$Image, " ")))

m <- matrix(Train_Images[5],96,96)

image(m)
