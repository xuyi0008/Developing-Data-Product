library(shiny)
library(markdown)

shinyUI(navbarPage("Best Car to Buy",
#Developing Data Product Week 4 - To develop a Shiny app to help people choose what car to buy using mtcars dataset. 
# This is the ui code.

# Define UI for application that draws a histogram

    # Application title
    tabPanel("Table"),

    sidebarLayout(
        sidebarPanel(
            helpText("Provide information about your dream car"),
            numericInput("mpg", "Desired fuel efficiency in miles per gallon", min=5, max=30, value=c(5,30), step=1),
            checkboxGroupInput("am", "Transmission", c("Automatic"=0, "Manual"=1), selected = c(0,1)),
            checkboxGroupInput("gear", "Number of gears", c("Three"=3, "Four"=4), selected = c(3,4)),
            sliderInput("hp", "Gross horsepower",min=50, max=340, value=c(50,340), step=10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            dataTableOutput("table")
        )
    )
))