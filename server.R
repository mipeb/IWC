library(shiny)


idealWeight <- function(age, gender, height) {

  d <- 1;
  toInch = height / 2.54;  # height is in cm
  feet5 <- 12 * 5;
  if( toInch > feet5 ){
      toInch <- toInch - feet5;
  } else {
      toInch <- 0;
  }
  
  if( gender == "man" ){
    d <- 52 + 1.9 * toInch;
  } else { # gender = "woman"
    d <- 49 + 1.7 * toInch;
  }
  
#   J. D. Robinson Formula (1983)  
#   52 kg + 1.9 kg per inch over 5 feet (man)
#   49 kg + 1.7 kg per inch over 5 feet (woman) 
  
  return(d);
}



shinyServer(
  function(input, output) {
    age <- reactive({as.numeric(input$age)})
    height <- reactive({as.numeric(input$height)})
    output$inputTxt <- renderText( paste("You are a", as.character({age()}), "years old",{input$gender}, "with a height of", as.character({height()}),"cm") )  
    output$idealWeight <- renderText({ idealWeight({age()}, input$gender, {height()})})
  }
)
