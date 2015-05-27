**Realizado por Federico Tejeiro**

Este programa es un código para reconocimiento facial. 

Está basado en la competicion de Kaggle:  https://www.kaggle.com/c/facial-keypoints-detection y se ha usado para aprender algunos aspectos de R y de la minería de datos. El código busca identificar, a partir de la imagen de una cara, 15 puntos faciales de la misma.

El fichero *training.csv* tiene 7049 ejemplos ya acabados, es decir es una matriz con 7949 filas y 31 columnas (los valores de x e y de cada uno de los quince puntos faciales) y una última columna que representa la imagen. 

Los datos contenidos en *training.csv*, por tanto, se presentan de la siguiente manera: 30 columnas con valores enteros de 1 a 96 indicando la posición X e Y de cada punto facial de una imagen de 96 x 96 pixeles y una última columna que representa la imagen en un vector con 96 x 96 = 9216 valores de gris (de 0 a 255) separados por un espacio.

Hemos creado un primer fichero: **LeerImagenes.R** para visualizar las imagenes del fichero  *training.csv* y marcar los 15 puntos de la cara.


