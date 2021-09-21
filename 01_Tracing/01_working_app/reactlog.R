library(shiny)
library(reactlog)

# tell shiny to log all reactivity
reactlog_enable()

# run a shiny app
runApp(appDir = "app.R")

# once app has closed, display reactlog from shiny
shiny::reactlogShow()
