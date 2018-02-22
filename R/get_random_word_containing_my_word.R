##' Random word containing provided word
##'
##' This function takes a word as input and outputs a random word that contains the given word.
##' @param myword This is a string.
##' @export
##' @examples
##' get_random_word_containing_my_word("evolution")

get_random_word_containing_my_word <- function(myword) {
  allwords <- readLines("https://raw.githubusercontent.com/dwyl/english-words/master/words.txt")
  indices <- grep(pattern = myword,x = allwords)
  if (length(indices) == 0) {
    return("Sadly, there are no words that contain your word.")
  } else if (length(indices) == 1) {
    return(allwords[indices])
  } else {return(allwords[sample(indices,1)])}
}