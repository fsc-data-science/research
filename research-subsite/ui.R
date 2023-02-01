library(shiny)
source("global.R")


# Define UI 
shinyUI(fluidPage(
tags$head(
  title = "Flipside Data Science",
  tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
  tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css?family=Questrial"),
  tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css?family=Inter")
),
withTags({
  header(class="top-banner",
         section(
           a(class="fs-logo", href="https://www.flipsidecrypto.com", img(src = "FLIPSIDE-BRAND-1-WHITE.png", width = "75%")),
           section(class="socials",
                   a(class="twitter", target = "_blank", href="https://twitter.com/flipsidecrypto", "Twitter"),
                   a(class="linkedin", target = "_blank", href="https://www.linkedin.com/company/flipside-crypto", "LinkedIn"),
                   a(class="discord", target = "_blank", href="https://flipsidecrypto.com/discord", "Discord"),
                   a(href="https://next.flipsidecrypto.xyz/", target = "_blank", "Explore our data!")
           )
         )
  )
}),
hr(class = "break-line"),
h2("Apps, Dashboards, Research, & Open Source Tools"), 
div(class = "button-search",
    fluidRow(
      column(6, 
             div(class = "button-area",
             actionButton(class = 'btn', "code", "Incl. Code", width = "120px"),
             actionButton(class = 'btn', "community", "Community", width = "120px"),
             actionButton(class = 'btn', "flipside", "Flipside", width = "120px"),         
             )),
      column(6,
             div(class = "search-bar",
                 textInput("search_text", label = "Search", value = "", placeholder = "app l2 research dex calculator bridge")
             ))
    )),
div(class = "entry-layout",
   uiOutput("select_entries")
    )


))
