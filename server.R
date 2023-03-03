server <- function(input, output) {

  # Load the iris data from the "iris" table in the "iris.db" database
  iris_data <- reactive({
    dbGetQuery(con, "SELECT * FROM iris1")
  })

  # Render the scatterplot based on user input and the iris data
  output$scatterplot <- renderPlot({
    ggplot(iris_data(), aes(x = iris_data()[[input$x_var]], y = iris_data()[[input$y_var]], color = Species)) +
      geom_point()
  })
}
