library(rvest)

wlist <- read.csv('https://raw.githubusercontent.com/dhairavc/DATA607/master/whitelist.csv')



extract_words <- function(link) {
  # download the html and turn it into an XML file with read_html()
  job <- read_html(url1)
  # extract specific nodes with html_nodes() using css selector
  skills <- html_nodes(job, ".description__text--rich li")
  # extract content from nodes
  skills <- html_text(skills)
  # remove punctuation
  words <- gsub('[[:punct:]]', '', skills)
  # split sentences into individual words
  words <- unlist(strsplit(words, " "))
  words <- tolower(words)
  words <- words[words %in% wlist$Whitelist]
  
  # count the number of occurences of each word
  wordcount <- table(words)

  return(wordcount)
  
  
}


url1 <- "https://www.linkedin.com/jobs/view/data-scientist-at-lucas-group-1518264187?refId=c17c9773-0fa0-4aaa-9e40-288b8bf0dd84&trk=guest_job_details_topcard_title"
url2 <- "https://www.linkedin.com/jobs/view/data-scientist-at-lawrence-harvey-1518264621?refId=046443bb-e522-48c1-a694-0a889e98a3f3&trk=guest_job_details_topcard_title"

extract_words(url1)