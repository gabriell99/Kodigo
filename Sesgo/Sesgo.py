import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, accuracy_score

# Generar datos de clasificación desequilibrada
np.random.seed(42)
X = np.random.randn(100, 2)
y = np.hstack((np.ones(90), np.zeros(10)))  # 90 de clase 1, 10 de clase 0

# Crear el modelo de regresión logística
log_reg = LogisticRegression()
log_reg.fit(X, y)

# Realizar predicciones
y_pred = log_reg.predict(X)

# Calcular la matriz de confusión y el accuracy
cm = confusion_matrix(y, y_pred)
accuracy = accuracy_score(y, y_pred)

# Mostrar los resultados
print("Matriz de Confusión:")
print(cm)
print(f"\nAccuracy: {accuracy * 100:.2f}%")

# Visualización
plt.scatter(X[:, 0], X[:, 1], c=y, cmap='coolwarm', edgecolor='k', s=100, label="Datos Reales")
plt.title("Modelo Sesgado por Datos Desequilibrados")
plt.xlabel("Feature 1")
plt.ylabel("Feature 2")
plt.show()
