# En Python, instala matplotlib si no está instalado
# reticulate::py_install("matplotlib")

# Ejercicio 3: Usar Matplotlib en Python para generar gráficos y mostrarlos en R

# Cargar reticulate
library(reticulate)
reticulate::py_install("matplotlib")

# Importar matplotlib desde Python
plt <- import("matplotlib.pyplot")

# Crear datos en Python
x <- 1:10
y <- py_run_string("y = [i ** 2 for i in range(1, 11)]")$y
x
y

# Generar gráfico usando Python
plt$plot(x, y, marker='o', color='blue', label='x^2')
plt$title('Gráfico generado en Python')
plt$xlabel('X-Name')
plt$ylabel('Y-Name')
plt$legend()

# Mostrar gráfico en R
plt$show()

# En Python, instala scikit-learn si no está instalado
reticulate::py_install("scikit-learn")

# Ejercicio 4: Integración de Scikit-learn para entrenar un modelo en Python y evaluarlo en R

# Cargar reticulate
library(reticulate)

# Importar scikit-learn
sklearn <- import("sklearn")
train_test_split <- sklearn$model_selection$train_test_split

# Crear datos en Python (ejemplo sencillo de regresión lineal)
X <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), ncol=1)
y <- c(1.2, 2.3, 2.9, 4.5, 5.1, 5.9, 6.8, 8.1, 8.9, 10.2)



x
y
# Dividir los datos en conjunto de entrenamiento y prueba
split <- train_test_split(X, y, test_size=0.2, random_state=as.integer(42))

split

# Asignar los valores de la lista a las variables correspondientes
X_train <- split[[1]]
X_test <- split[[2]]
y_train <- split[[3]]
y_test <- split[[4]]

# Crear y entrenar el modelo
model <- sklearn$linear_model$LinearRegression()
model$fit(X_train, y_train)

# Hacer predicciones
y_pred <- model$predict(X_test)

y_pred
# Evaluar el modelo en R
mse <- sklearn$metrics$mean_squared_error(y_test, y_pred)
cat("Error Cuadrático Medio (MSE):", mse, "\n")

# Ejercicio 5: Manipular una estructura NumPy y analizarla en R
# En Python, asegúrate de que NumPy esté instalado
# reticulate::py_install("numpy")

# Cargar reticulate
library(reticulate)

# Importar numpy
np <- import("numpy")

# Crear una matriz aleatoria en Python
matrix_py <- np$random$rand(as.integer(5), as.integer(5))
matrix_py

# Convertir la matriz a un formato de R
matrix_r <- py_to_r(matrix_py)
matrix_r

# Realizar operaciones estadísticas en R
cat("Matriz generada en Python:\n")
print(matrix_r)

cat("Promedio de los valores en la matriz:", mean(matrix_r), "\n")
cat("Suma de los valores en la matriz:", sum(matrix_r), "\n")

