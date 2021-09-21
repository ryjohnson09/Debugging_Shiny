shinyApp(
  ui = fluidPage(
    selectInput("n", "N", 1:10),
    plotOutput("plot")
  ),
  server = function(input, output, session) {
    output$plot <- renderPlot({
      n <- input$n * 2
      plot(head(cars, n))
    })
  }
)