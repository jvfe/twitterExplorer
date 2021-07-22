#' Get number of unique occurrences tweet based on a column
#'
#' This is useful for creating value boxes.
#'
#' @param data
#' @param col
#'
#' @return
#' @export
#'
#' @examples
get_unique_value <- function(data, col) {
  col <- dplyr::enquo(col)
  data %>%
    dplyr::pull(!!col) %>%
    unique() %>%
    length()
}


#' Get code for embedding a tweet
#'
#' @param user User screename
#' @param status_id Tweet Status ID
#'
#' @return
#' @export
#'
#' @examples
get_tweet_embed <- function(user, status_id) {

  url <- stringr::str_glue("https://publish.twitter.com/oembed?url=https://twitter.com/{user}/status/{status_id}&partner=&hide_thread=false")


  response <- httr::GET(url) %>%
    httr::content()

  return(shiny::HTML(response$html))
}

#' Use GitHub Action to Update data/dashboard
#'
#' @return
#' @export
#'
#' @examples
use_gh_action <- function() {
  if (fs::dir_exists("./.github/workflows/") == FALSE) {
    fs::dir_create("./.github/workflows/", recurse = TRUE)
  }
  fs::file_copy("./R/gh_action.yml", "./.github/workflows/update.yml", overwrite = TRUE)
}
