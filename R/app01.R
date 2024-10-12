# Ejercicio 1: Aplicación de Conversión de Unidades
# Este ejercicio crea una aplicación que convierte de kilómetros a millas y viceversa.

# Instalacion de paqueterias que se utilizaran
# install.packages('shiny')

# Cargar las librerías necesarias
library(shiny)

# Definir la interfaz de usuario (UI)
ui <- fluidPage(
  titlePanel("Conversión de Unidades: Kilómetros <-> Millas"),
  sidebarLayout(
    sidebarPanel(
      numericInput("value", "Ingresa un valor:", 1),
      selectInput("conversion", "Selecciona la conversión:",
                  choices = list("Kilómetros a Millas" = "km_to_miles",
                                 "Millas a Kilómetros" = "miles_to_km"))
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Definir la lógica del servidor (Server)
server <- function(input, output) {
  output$result <- renderText({
    value <- input$value
    conversion <- input$conversion
    
    if (conversion == "km_to_miles") {
      result <- value * 0.621371
      paste(value, "Kilómetros son", round(result, 2), "Millas")
    } else {
      result <- value / 0.621371
      paste(value, "Millas son", round(result, 2), "Kilómetros")
    }
  })
}

# Ejecutar la aplicación Shiny
shinyApp(ui = ui, server = server)
