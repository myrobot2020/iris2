library(shiny)
library(ggplot2)
library(RSQLite)

# Connect to the "iris" database
con <- dbConnect(SQLite(), "iris.db")

# Define the UI for the app
ui <- fluidPage(
  titlePanel("Iris Data"),
  sidebarLayout(
    sidebarPanel(
      selectInput("x_var", "X-axis variable:", choices = names(iris)[-5]),
      selectInput("y_var", "Y-axis variable:", choices = names(iris)[-5])
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)
