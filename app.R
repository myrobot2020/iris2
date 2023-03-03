# library(shiny)
# library(ggplot2)
# library(RSQLite)
# 
# # Connect to the "iris1" database
# con <- dbConnect(SQLite(), "iris.db")
# 
# # Define the UI for the app
# ui <- fluidPage(
#   titlePanel("Iris Data"),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("x_var", "X-axis variable:", choices = names(iris)[-5]),
#       selectInput("y_var", "Y-axis variable:", choices = names(iris)[-5])
#     ),
#     mainPanel(
#       plotOutput("scatterplot")
#     )
#   )
# )
# 
# # Define the server function
# server <- function(input, output) {
#   
#   # Load the iris data from the "iris" table in the "iris.db" database
#   iris_data <- reactive({
#     dbGetQuery(con, "SELECT * FROM iris1")
#   })
#   
#   # Render the scatterplot based on user input and the iris data
#   output$scatterplot <- renderPlot({
#     ggplot(iris_data(), aes(x = iris_data()[[input$x_var]], y = iris_data()[[input$y_var]], color = Species)) +
#       geom_point()
#   })
# }
# 
# # Run the app
# shinyApp(ui = ui, server = server)


library(shiny)

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)
