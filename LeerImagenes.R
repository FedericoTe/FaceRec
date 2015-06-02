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

######################################
#               VISUALIZAR LAS IMÁGENES
######################################
#
# 
# La ultima columna de Train es una imagen. Para visualizarla debemos dar 3 pasos:
#
# 1.- Seleccionamos una num_imagen <- NUMERO
# 2.- Separamos la lista por los espacios en blanco y lo ponemos como un vector de números enteros
#  Imagen_Train <- as.integer(unlist(strsplit(Train$Image[num_imagen], " ")))
# 3.- Las convertimos en una matriz de 96 x 96 pixeles revertiendo previamente los valores, si no la imagen sale boca abajo
# m_1 <- matrix(rev(Imagen_Train),96,96)
#
###############################################


# Definimos una funcion que haga lo anterior segun el indice

Get_Image_Matrix <- function(Columna_Imagen = Train$Image,Numero_de_Imagen)
{
  temp <- as.integer(unlist(strsplit(Columna_Imagen[Numero_de_Imagen]," ")))
  Resultado <- matrix(rev(temp),96,96)
  Resultado
}

###############
# CONVERTIR TODAS LAS IMAGENES
#############
#
#
#  Para ello  vamos a definir una lista, inicialmente vacía, y que contendrá todas las matrices, podemos así acceder a una imagen con Lista[[NumeroImagen]]
#
#  La lista la vamos aumentando con Las_Imagenes[[length(Las_Imagenes)+1]] <- NUEVA_MATRIZ
#
# Y calculamos cada MATRIZ con un bucle del tipo:
#
#    for(i in 1:length(Train)){
#        m <- Get_Image_Matrix(Columna_Imagen = Train$Image,Numero_de_Imagen = i)
#        Las_Imagenes[[length(Las_Imagenes)+1]] <- m
#    }
#
#  Implementado como un lapply tengo que definir la lista de todas las imagenes 
#
###########################################3


# Definimos el indice

indice <- seq(1:length(Train$Image))

# Definimos la lista que va conteniendo todas las imagenes en su formato de matriz 96 x 96 pixeles

Las_Imagenes <- list()

# La llenamos haciendo el apply

Todas_Imagenes<- lapply(indice, function(x) 
  {
      temp <- Get_Image_Matrix(Columna_Imagen = Train$Image,Numero_de_Imagen = x)
      Las_Imagenes[[length(Las_Imagenes)+1]] <- temp
  })



# Ahora podemos guardar las imagenes con: 

saveRDS(Todas_Imagenes,file= "DATA/Imagenes.saved")

# Y cargarla con:
#Todas_Imagenes <- readRDS("DATA/Imagenes.saved")

#####################################################
# VER LAS IMAGENES Y LOS PUNTOS CARACTERÍSTICOS
#####################################################
#
# Para ver las imagenes una a una elegimos el numero de imagen y la ponemos en blanco y negro
#  NumeroImagen <- 3
#  image(1:96,1:96,Las_Imagenes[[NumeroImagen]],col=gray((0:255)/255))
#
# Podemos ahora marcar los puntos de esta imagen con un bucle for:
#
#   for (i in seq(from = 1, to = (ncol(Train)-2) ,by =2)){
#     points(96-Train[1,i],96-Train[1,i+1], col = "green", pch = 19)
#   }
#
# Implementada como un apply aplicadas a los indices:
#
###################################################


# Para ver las imagenes una a una elegimos el numero de imagen 

NumeroImagen <- 1906

# la vemos  en blanco y negro

image(1:96,1:96,Todas_Imagenes[[NumeroImagen]],col=gray((0:255)/255))

# Podemos ahora marcar los puntos de esta imagen con un bucle for:
#
#for (i in seq(from = 1, to = (ncol(Train)-2) ,by =2)){
#  points(96-Train[1,i],96-Train[1,i+1], col = "green", pch = 19)
#}
#
# O bien con las funciones apply aplicadas a los indices:

indice <- seq(from = 1, to = (ncol(Train)-2) ,by =2)
lapply(indice, function(x,y) points(96-y[NumeroImagen,x],96-y[NumeroImagen,x+1], col = "blue", pch = 19), y=Train )


# Para ver la variabilidad del centro del ojo izquierdo podemos hacer:
# Primero ver qué columnas tienen esas coordenadas con: colnames(True)
# Ahora aplicar este lapply

lapply(1:nrow(Train),function(x,y) points(96-y[x,1],96-y[x,2], col = "red", pch=19),y=Train)


