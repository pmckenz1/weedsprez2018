library(rvest)
library(stringr)
follow_link <- function(new_link) {
    test.page<-read_html(new_link)
    page.title.full<-as.character(html_nodes(test.page,
                                             "head title"))
    title <- str_sub(page.title.full,
                     str_locate(page.title.full,
                                "<title>")[2]+1,
                     str_locate(page.title.full,
                                " - Wiki")[1]-1)
    node.vector <- logical(0)
    for (i in 1:length(html_nodes(test.page,css="p"))) {
      node.vector <- c(node.vector,
                       str_detect(as.character(html_nodes(test.page,
                                                          css="p")[i]),
                                  "<b>"))
    }
    beginning.text<-as.character(html_nodes(test.page,
                                            css="p")[node.vector][1])
    return(list(title,
                beginning.text))
}

find_first_link <- function(htmltext) {
    sub_start <- as.numeric(str_locate(htmltext,
                                       ' <a href=\\"/wiki')[1,2])-3 #excludes parantheses
    sub_end <- min(str_locate_all(htmltext,
                                  "</a>")[[1]][,1][which((str_locate_all(htmltext,
                                                                         "</a>")[[1]][,1]-sub_start) > 0)])-1
    first_link_long<-str_sub(htmltext,
                             sub_start,
                             sub_end)
    
    sub_start <- str_locate(first_link_long,
                            "wiki/")[2]+1
    sub_end <- min(str_locate_all(first_link_long,
                                  " ")[[1]][,1][which(str_locate_all(first_link_long,
                                                                     " ")[[1]][,1]-sub_start > 0)])-2
    
    return(str_sub(first_link_long,
                   sub_start,
                   sub_end))
}

## how many pages do you visit before you enter a loop?
link <- "https://en.wikipedia.org/wiki/Special:Random"
titles <- character(0)
trigger <- 0
while (trigger == 0) {
  link_content <- follow_link(new_link = link)
  if (sum(titles == link_content[[1]]) > 0) {trigger <- 1}
  titles <- c(titles,link_content[[1]])
  newtitle<- find_first_link(link_content[[2]])
  link <- paste0("https://en.wikipedia.org/wiki/",newtitle)
  
}
num_until_loop <- min(which(titles == tail(titles,1)))-1
loop_size <- max(which(titles == tail(titles,1)))-min(which(titles == tail(titles,1)))

