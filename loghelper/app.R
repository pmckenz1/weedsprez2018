#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Plotting in log-log space"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("a",
                     "a value:",
                     min = 0,
                     max = 10,
                     value = 1,
                     step = 0.1),
         sliderInput("c",
                     "c value:",
                     min = 0,
                     max = 5,
                     value = 1,
                     step = 0.1),
         sliderInput("intercept",
                     "intercept:",
                     min = 0,
                     max = 50,
                     value = 0,
                     step = 0.1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        fluidRow(
          splitLayout(cellWidths = c("50%", "50%"), plotOutput("plotgraph1"), plotOutput("plotgraph2"))
        )
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  pt1 <- reactive({
    x <- seq(1,30,by = .1)
    y <- input$c*x^input$a+input$intercept
    plot(x,
           y, 
           main = "Linear-Linear Space",
          type = "l",
          lwd = 7)
    abline(a = 0,b=1,lty=2)
          #type = "l",
          #lwd = 7)
    })
  pt2 <- reactive({
    x <- seq(1,30,by = .1)
    y <- input$c*x^input$a+input$intercept
    plot(x,
           y, 
           main = "Log-Log Space",
          log = "xy",
          type = "l",
          lwd = 7)
          #type = "l",
          #lwd = 7)
    abline(a = 0,b=1,lty = 2)
    })
  
  output$plotgraph1 = renderPlot({pt1()})
  output$plotgraph2 = renderPlot({pt2()})
}

# Run the application 
shinyApp(ui = ui, server = server)

