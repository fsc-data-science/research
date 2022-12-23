
# Load Entries ---- 
entries <- read.csv(file = "entries.csv", row.names = NULL)

# Generate Card ----
generate_card <- function(title, url, description, imgsrc){
  
  return(
    tagList(
        fluidRow(
          div(class = "bountylinkc",
              column(9, class = "bountytitle", 
                     a(href = url,
                       title,
                       target = "_blank"),
                     div(class = "description", 
                         description)),
              column(3, class = "bountyicon", 
                     a(href = url,
                       img(class = "roundie", src = imgsrc, width = "75px"),
                       target = "_blank"))
              
          )
        )
      )
    )
}

# Print HTML for Cards ----
print_select_cards <- function(entries){
  items <- NULL
  for(i in 1:nrow(entries)){
    items <- c(items, generate_card(entries$title[i], 
                  entries$url[i],
                  entries$description[i],
                  entries$imgsrc[i])
    )
  }
  return(
    tagList(items)
  )
}

# Search Entries ---- 
search_tags <- function(searchstring, entries){
  
  if(is.null(searchstring)){
    return(entries)
  }
  
  search_words <- unlist(strsplit(searchstring, " "))
  
  # if at least 1 word in search_words is found in the entries$tags 
  # keep that entry; otherwise filter it out.
  
  at_least_1_word_found <- {
    unlist(
      lapply(entries$tags, 
             function(x){
               atleast1 <- NULL
               for(i in search_words){
                 atleast1 <- c(atleast1, grepl(i, x, ignore.case = TRUE))
               }
               if(is.logical(atleast1)){
               return(mean(atleast1) > 0)
               }
             })
    )
  }
  
  return(
    entries[at_least_1_word_found, ]
  )
}


