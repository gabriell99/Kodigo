#AIML- INCAF-1
#Módulo 1: Identificar origen de datos
#Desarrollar un proyecto completo de ciencia de datos utilizando R

###1. Elección del conjunto de datos
#Selecciona un conjunto de datos que despierte tu interés. 
#Pueden ser datos provenientes cualquiera área, como salud, finanzas
#, deportes, medio ambiente, etc. Recuerda que el conjunto de datos debe ser 
#suficientemente grande para realizar un análisis significativo (mínimo 1000 filas 
#y varias variables) y debe estar disponible en un formato legible por R, como csv
#, json, excel, etc. Puedes encontrar conjuntos de datos en plataformas como kaggle
#, uci machine learning repository, o google dataset search.

# Instalar y cargar la librería readr
install.packages("readr")
library(readr)

# Leer el archivo CSV
data <- read_csv("vgsales.csv")

# Mostrar las primeras filas del DataFrame
head(data)
