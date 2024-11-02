from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Cargar el pipeline de preprocesamiento y el modelo
preprocessor_loaded = joblib.load('preprocessor_pipeline.pkl')
model_loaded = joblib.load('logistic_regression_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Obtener los datos JSON de la solicitud POST
        data = request.json
        
        # Imprimir los datos para asegurarnos de que están llegando correctamente
        print("Datos recibidos:", data)
        
        # Convertir los datos JSON en un DataFrame de pandas
        df = pd.DataFrame([data])

        # Aplicar el preprocesamiento
        X_transformed = preprocessor_loaded.transform(df)

        # Hacer la predicción con el modelo cargado
        prediction = model_loaded.predict(X_transformed)

        # Devolver la predicción como respuesta JSON
        return jsonify({'prediction': int(prediction[0])})
    
    except KeyError as e:
        return jsonify({'error': f'Clave faltante en los datos: {e}'}), 400
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
