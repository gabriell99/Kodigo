# Instalación de reticulate y ggplot2 en R
# install.packages("reticulate")
# install.packages("ggplot2")

# En Python, asegúrate de tener pandas instalado:
reticulate::py_install("pandas")
# En Python, instala numpy:
reticulate::py_install("numpy")

install.packages("reticulate")

# Ingresar al modo Python
# repl_python()
library(reticulate)
library(ggplot2)

#EJERCICIO 1

# Usar reticulate para cargar pandas
pd <- import("pandas")

# Crear un DataFrame en Python usando pandas
data <- pd$DataFrame(
  dict(
    nombre = c('Ana', 'Luis', 'Juan', 'Maria'),
    edad = c(23, 45, 30, 35),
    salario = c(50000, 60000, 45000, 52000)
  )
)

# Imprimir el DataFrame
print(data)

# Convertir el DataFrame de Python a R para graficar
df_r <- py_to_r(data)

# Visualizar en R usando ggplot2
ggplot(df_r, aes(x = edad, y = salario, label = nombre)) +
  geom_point() +
  geom_text(vjust = -1) +
  theme_minimal() +
  labs(title = "Edad vs. Salario")

#EJERCICIO 2

# Importar numpy desde Python
np <- import("numpy")

# Generar 1000 números aleatorios normalmente distribuidos en Python
data_py <- np$random$normal(loc = 50, scale = 5, size = as.integer(1000))








# Convertir los datos de Python a R
data_r <- py_to_r(data_py)

# Realizar análisis estadístico en R
summary_stats <- summary(data_r)
print(summary_stats)

# Graficar el histograma de los datos
hist(data_r, breaks = 30, col = "skyblue", main = "Distribución normal generada en Python",
     xlab = "Valores")
