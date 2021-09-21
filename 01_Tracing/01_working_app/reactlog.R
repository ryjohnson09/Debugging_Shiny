library(shiny)
library(reactlog)

# tell shiny to log all reactivity
reactlog_enable()

# run a shiny app
runApp(appDir = "01_Tracing/01_working_app/")

# once app has closed, display reactlog from shiny
shiny::reactlogShow()
