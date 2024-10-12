# Ejercicio 3: Calculadora de Interés Compuesto
# Este ejercicio crea una aplicación que permite calcular el interés compuesto a partir de un capital inicial, una tasa de interés, el número de años, 
# y la cantidad de veces que se capitaliza el interés al año.

# Cargar las librerías necesarias
library(shiny)

# Definir la interfaz de usuario (UI)
ui <- fluidPage(
  titlePanel("Calculadora de Interés Compuesto"),
  sidebarLayout(
    sidebarPanel(
      numericInput("principal", "Capital Inicial (P):", value = 1000),
      numericInput("rate", "Tasa de Interés Anual (%)", value = 5),
      numericInput("years", "Número de Años (t):", value = 10),
      numericInput("n", "Número de veces que se capitaliza por año (n):", value = 1)
    ),
    mainPanel(
      textOutput("result")
    )
  )
)

# Definir la lógica del servidor (Server)
server <- function(input, output) {
  output$result <- renderText({
    # Variables de entrada
    P <- input$principal
    r <- input$rate / 100
    t <- input$years
    n <- input$n
    
    # Fórmula del interés compuesto
    amount <- P * (1 + r / n)^(n * t)
    
    # Resultado
    paste("El monto total después de", t, "años es:", round(amount, 2), "USD")
  })
}

# Ejecutar la aplicación Shiny
shinyApp(ui = ui, server = server)
