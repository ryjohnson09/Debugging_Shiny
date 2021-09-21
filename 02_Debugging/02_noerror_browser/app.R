# Header --------------------------------------------------------
library(shiny)

# UI ------------------------------------------------------------
ui <- fluidPage(

    # Sidebar 
    sidebarLayout(
        sidebarPanel(
            
            # Change Title
            textInput("title",
                      "Change plot title:",
                      value = "Old Faithful Geyser Data"),
            # Change Bins
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            # Change bin color
            radioButtons("bincolor",
                         "Select Bin Color:",
                         choices = c("red", "blue", "green"))
        ),

        # Display histogram
        mainPanel(
           plotOutput("histplot")
        )
    )
)

# Server --------------------------------------------------------
server <- function(input, output) {
    
    # Get Data
    x <- faithful[, 2]
    
    # Title
    plot_title <- reactive({
        input$title
    })
    
    # Bins
    bins <- reactive({
        seq(min(x), 
            max(x), 
            length.out = input$bins + 1)
    })
    
    # Bin Color
    bin_color <- reactive({
        input$bincolors
    })

    # Draw Histogram
    output$histplot <- renderPlot({
        
        # Enter interactive debugger if 
        #  bin color is missing
        if (is.null(bin_color())) {
            browser()
        }
        
        hist(x, 
             breaks = bins(), 
             col = bin_color(), 
             border = 'black', 
             main = plot_title())
    })
}

# Run App ------------------------------------------------------- 
shinyApp(ui = ui, server = server)
