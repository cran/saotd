% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tweet_min_scores.R
\name{tweet_min_scores}
\alias{tweet_min_scores}
\title{Twitter Data Minimum Scores}
\usage{
tweet_min_scores(DataFrameTidyScores, HT_Topic, HT_Topic_Selection = NULL)
}
\arguments{
\item{DataFrameTidyScores}{DataFrame of Twitter Data that has been tidy'd 
and scored.}

\item{HT_Topic}{If using hashtag data select:  "hashtag".  If using topic 
data select:  "topic".}

\item{HT_Topic_Selection}{The hashtag or topic to be investigated.  NULL will 
find min across entire dataframe.}
}
\value{
A Tibble.
}
\description{
Determines the minimum scores for either the entire dataset or 
  the minimum scores associated with a hashtag or topic analysis.
}
\examples{
\dontrun{
library(saotd)
data <- raw_tweets
tidy_data <- Tidy(DataFrame = data)
score_data <- tweet_scores(DataFrameTidy = tidy_data,
                           HT_Topic = "hashtag")
min_scores <- tweet_min_scores(DataFrameTidyScores = score_data,
                               HT_Topic = "hashtag")
                            
data <- raw_tweets
tidy_data <- Tidy(DataFrame = data)
score_data <- tweet_scores(DataFrameTidy = tidy_data,
                     HT_Topic = "hashtag")
min_scores <- tweet_min_scores(DataFrameTidyScores = score_data,
                               HT_Topic = "hashtag",
                               HT_Topic_Selection = "icecream")
}
}
