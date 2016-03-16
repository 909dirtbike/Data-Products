# Load the shiny package
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

#load data
data(swiss)
swiss <- add_rownames(swiss, "province")
swiss <- swiss[order(swiss$province),] 
swiss$province <- factor(swiss$province)

# Define UI 
shinyUI(fluidPage(
        # Header Panel
        headerPanel(title = h3("Exploring the Swiss Dataset", align = "center")),
        sidebarLayout(
                sidebarPanel(("Choose measures for charts below"),
                        br(),
                        selectInput("col", "Barchart measure", choices = c("Fertility" = 1, "Agriculture" = 2, "Examination" = 3, "Education" = 4, "Catholic" = 5, "Infant.Mortality" = 6)),     
                        br(),
                        br(),
                        selectInput("col2", "Scatterplot X axis", choices = c("Fertility" = 1, "Agriculture" = 2, "Examination" = 3, "Education" = 4, "Catholic" = 5, "Infant.Mortality" = 6), selected = 1),
                        selectInput("col3", "Scatterplot Y axis", choices = c("Fertility" = 1, "Agriculture" = 2, "Examination" = 3, "Education" = 4, "Catholic" = 5, "Infant.Mortality" = 6), selected = 5)
                        
                        ),
                                     
                                
                mainPanel(
                    tabsetPanel(type = "tab",
                                
                                tabPanel("Instructions", textOutput("mytext")),
                                tabPanel("Barchart",plotlyOutput("mybar", height = 1000, width = 1000)),
                                tabPanel("Scatterplot", plotlyOutput("myscat", height = 800, width = 800)),
                                tabPanel("Data", dataTableOutput("mytable")))
                          
                
                       )

)))