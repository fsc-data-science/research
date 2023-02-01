source("global.R")
library(shiny)


# Define server logic 
shinyServer(function(input, output, session) {

  # accept user search terms as big string
search_terms <- reactive({
  input$search_text
})
  

code_filter <- reactive({
  input$code %% 2 == 1  
})

observeEvent(input$code, {
  if(code_filter()){
    updateActionButton(session, inputId = "code", label = "Code Filter")
  } else {
    updateActionButton(session, inputId = "code", label = "Open Source")
  }
  
})

community_filter <- reactive({
  input$community %% 2 == 1  
})

observeEvent(input$community, {
  if(community_filter()){
    updateActionButton(session, inputId = "community", label = "Comm. Filter")
  } else {
    updateActionButton(session, inputId = "community", label = "Community")
  }
  
})


flipside_filter <- reactive({
  input$flipside %% 2 == 1  
})

observeEvent(input$flipside, {
  if(flipside_filter()){
    updateActionButton(session, inputId = "flipside", label = "Flip. Filter")
  } else {
    updateActionButton(session, inputId = "flipside", label = "Flipside")
  }
  
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

button_entries <- eventReactive(list(search_terms(), input$code, input$community, input$flipside), {
  
  final_filter <- select_entries()
  
  if(code_filter()){
    final_filter <- final_filter[final_filter$code == "yes", ]
  }
  
  # if both on, ignore both.
  if(community_filter() & flipside_filter()){
    final_filter
  } else { 
    if(community_filter()){
      final_filter <- final_filter[final_filter$source == "Community", ]
      final_filter
    }
    if(flipside_filter()){
      final_filter <- final_filter[final_filter$source == "Flipside", ]
      final_filter
    }
    final_filter
  }
})


# show only entries that pass search check
output$select_entries <- renderUI({
  print_select_cards(button_entries())
})
  
})
