library(shiny)
source("global.R")

# Define server logic 
shinyServer(function(input, output) {

  # accept user search terms as big string
search_terms <- reactive({
  input$search_text
})
  
 # parse search using search_tags()
select_entries <- reactive({
  
  if(is.null(search_terms())){
    entries
  } 
  
  select_ <- search_tags(search_terms(), entries)
  
  if(nrow(select_) == 0){
    entries
  } else { 
    select_
  }
})

# show only entries that pass search check
output$select_entries <- renderUI({
  print_select_cards(select_entries())
})
  
})
