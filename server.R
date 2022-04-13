library(shiny)
library(datasets)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$table <- renderDataTable({
                hp_seq <- seq(from = input$hp[1], to = input$hp[2], by = 0.1)
        data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                          Gear = gear,
                          Horsepower = hp, 
                          Transmission = am)
        data <- filter(data, MilesPerGallon <= input$mpg, Gear %in% input$gear, 
                       Horsepower %in% hp_seq, Transmission %in% input$am)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        data <- arrange(data, Horsepower)
        data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
    })