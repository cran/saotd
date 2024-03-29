
# Test Data
# Data for hashtag
test_HT_df <- dplyr::tibble(
  text = c("I really love and hate my dog, he is the best most amazing friend anyone could ever ask for!
           I really hate my love to hate on my stupid dog, he is the worst friend anyone could ever ask for!",
           "cats are the best most amazing friends anyone could ask for "),
  hashtags = c("dog", "cat"),
  created_at = lubridate::as_datetime(c('2018-02-09 17:56:30', '2018-02-10 18:46:10')),
  key = c("coolguy123", "crazycatperson1234"))

test_HT_Tidy <- saotd::tweet_tidy(
  DataFrame = test_HT_df)
test_HT_Tidy_Scores <- saotd::tweet_scores(
  DataFrameTidy = test_HT_Tidy, 
  HT_Topic = "hashtag")

p <- saotd::tweet_violin(
  DataFrameTidyScores = test_HT_Tidy_Scores, 
  HT_Topic = "hashtag")

# Data for topic 
test_Topic_df <- dplyr::tibble(
  text = c("I really love and hate my dog, he is the best most amazing friend anyone could ever ask for!  
           I really hate my love to hate on my stupid dog, he is the worst friend anyone could ever ask for!",
           "cats are the best most amazing friends anyone could ask for except when they are being miserable horrible terrible demon spawn"),
  Topic = c("dog", "cat"), 
  created_at = lubridate::as_datetime(c('2018-02-09 17:56:30', '2018-02-10 18:46:10')),
  key = c("coolguy123", "crazycatperson1234"))

test_Topic_Tidy_df <- saotd::tweet_tidy(
  DataFrame = test_Topic_df)
test_Topic_Tidy_Scores <- saotd::tweet_scores(
  DataFrameTidy = test_Topic_Tidy_df, 
  HT_Topic = "topic")

t <- saotd::tweet_violin(
  DataFrameTidyScores = test_Topic_Tidy_Scores, 
  HT_Topic = "topic")

# Tests
testthat::test_that("The tweet_violin function properly ingests data frame", {
  
  testthat::expect_error(
    object = saotd::tweet_violin(
      DataFrameTidyScores = text),
    "The input for this function is a data frame.")
  
  testthat::expect_error(
    object = saotd::tweet_violin(
      DataFrameTidyScores = test_HT_Tidy_Scores, 
      HT_Topic = "HT"), "HT_Topic requires an input of either hashtag for analysis using hashtags, or topic for analysis looking at topics.")
  
})

testthat::test_that("The tweet_violin plot retunrs ggplot object when using hashtags", {
  
  testthat::expect_type(object = p,
                        type =  "list")
  
})

testthat::test_that("The tweet_violin plot retunrs ggplot object when using topics", {
  
  testthat::expect_type(object = p,
                        type =  "list")
  
})
