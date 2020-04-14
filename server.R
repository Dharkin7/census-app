# server.R
  source("helpers.R") 
    counties <- readRDS("data/counties.rds")
    library(maps) 
    library(mapproj)
    
shinyServer(
  function(input, output) {
    
  
    output$map <- renderPlot({
      
      data <- switch(input$var, 
          "Percent Asian" = counties$asian,            
          
          "Percent Black" = counties$black,
          
          "Percent Hispanic" = counties$hispanic,
          
          "Percent White" = counties$white)
      
      color <- switch(input$var, 
          "Percent Asian" = "purple",
          
          "Percent Black" = "black",
          
          "Percent Hispanic" = "orange",
          
          "Percent White" = "green")
      
      legend <- switch(input$var, 
          "Percent Asian" = "% Asian",
          
          "Percent Black" = "% Black",
          
          "Percent Hispanic" = "% Hispanic",
          
          "Percent White" = "% White")
      
      percent_map(data, color, legend, 0, 100)
    })
      
  }
)

runApp
    