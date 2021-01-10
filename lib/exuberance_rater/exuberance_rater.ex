defmodule ExcessiveExuberanceDetector.ExuberanceRater do
  @moduledoc """
  Takes reviews as prepared by the `SiteScraper` and rates them. Assigns a
  score to each. The higher the score the more overly positive or exuberant
  the review.
  """

  def rate_reviews(raw_reviews) do
    raw_reviews
    |> Enum.map(&rate_single_review/1)
  end

  def rate_single_review(review) do
    review
    |> set_initial_score
    |> perform_sentiment_analysis
    |> calculate_average_sentiment_value_per_word
  end

  def set_initial_score(review), do: [0, review]

  def perform_sentiment_analysis([positivity_score, review]) do
    new_positivity_score =
      review
      |> Veritaserum.analyze

    [positivity_score + new_positivity_score, review]
  end

  def calculate_average_sentiment_value_per_word([positivity_score, review]) do
    word_count =
      review
      |> String.split(" ")
      |> Enum.count

    [positivity_score / word_count, review]
  end

  defp split_string_by_character(review) do
    review
    |> String.graphemes()
  end

  defp count_exclamation_points(review) do
    review
    |> Enum.count(fn letter -> letter == "!" end)
  end
end
