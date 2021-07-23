library(magrittr)
devtools::load_all()
#### Function call ####

getData("#rstats",
        5000,
        "data/tweets.csv.gz",
        "rtweet-exploration",
        include_rts = FALSE,
        retryonratelimit = TRUE)

