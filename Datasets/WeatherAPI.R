library(httr)
library(jsonlite)

# Definir la URL de la API
url <- "https://api.weatherapi.com/v1/forecast.json?key=56a3ba13d325472aaf930648241909&q=Cincinnati&days=10&aqi=no&alerts=no"

# Realizar la solicitud GET a la API
response <- GET(url)
response

# Verificar si la solicitud fue exitosa
if (status_code(response) == 200) {
  # Convertir la respuesta JSON a un formato de lista
  weather_data <- fromJSON(content(response, "text", encoding = "UTF-8"))
  
  # Extraer los datos de pronóstico
  forecast <- weather_data$forecast$forecastday
  forecast
  
  # Mostrar solo las primeras 3 columnas (sin conversiones, solo extracción simple usando índices)
  for (day in forecast) {
    print(day[1:3])  # Muestra las primeras 3 columnas (índices 1 a 3)
  }
  
} else {
  # En caso de error, imprimir el código de estado
  print(paste("Error:", status_code(response)))
}
