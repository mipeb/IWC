library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Ideal weight Calculator"),
    sidebarPanel(
      h3('Personal informations'),
      numericInput('age', 'Age (year)', 25, min = 1, max = 120, step = 1),
      radioButtons("gender", "Gender:", c("male" = "man","female" = "woman")),
      sliderInput('height', 'Height (cm)', min=30, max=240,
                       value=185, step=1, round=0)
      ,submitButton('Submit')
    ),
    mainPanel(
      h3('+--== Result ==--+'),
      verbatimTextOutput("inputTxt"),
      h4('Your ideal weight (in kg) is:')
      ,verbatimTextOutput("idealWeight")
    )
  )
)
