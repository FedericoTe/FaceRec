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
#  Fichero para dividir el archivo training.csv en dos partes y poder medir la efectividad del algoritmo de identificación
#
####################################

# Directorio de trabajo
setwd("~/Personal/GITHUB//FaceRec/")

# Cargar el data frame training.csv 

Train_Split <- read.csv("../DATA_FaceRec//Data/training.csv",stringsAsFactors=F)


######################################
#               DIVIDIR LOS DATOS EN  DOS DATA FRAME Mi.Train Y Mi.Test
######################################

# Definimos la proporción definida en porcentaje, ejemplo 80% sería proporcion <- 80

proporcion <- 80 

# Tamaño de la muestra:

Muestra_Size <- floor((proporcion/100) * nrow(Train_Split))

## Estableciendo un valor de la semilla (seed) hacemos el codigo reproducible

set.seed(123)

# Ahora viene la división:

Indice <- sample(seq_len(nrow(Train_Split)), size = Muestra_Size)

# Y definimos los nuevos data frame:

Mi.Train <- Train_Split[Indice, ]
Mi.Test <- Train_Split[-Indice, ]

