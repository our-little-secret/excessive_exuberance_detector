defmodule ExcessiveExuberanceDetector.ExuberanceRater do
  @moduledoc """
  Takes reviews as prepared by the `SiteScraper` and rates them. Assigns a
  score to each. The higher the score the more overly positive or exuberant
  the review.
  """
  @type rated_review :: nonempty_improper_list(float, String.t())
  @type rated_reviews :: nonempty_list(rated_review())

  @doc """
  Given a list of reviews, returns them rated.
  """
  # @spec rate_reviews(nonempty_list(String.t())) :: rated_reviews()
  def rate_reviews(raw_reviews) do
    raw_reviews
    |> Enum.map(&rate_single_review/1)
  end

  # @spec rate_single_review(String.t()) :: rated_review()
  def rate_single_review(review) do
    review
    |> set_initial_score
    |> perform_sentiment_analysis
    |> calculate_average_sentiment_value_per_word
  end

  # @spec set_initial_score(String.t()) :: rated_review()
  defp set_initial_score(review), do: [0.0, review]

  # @spec perform_sentiment_analysis(rated_review()) :: rated_review()
  def perform_sentiment_analysis([positivity_score, review]) do
    new_positivity_score =
      review
      |> Veritaserum.analyze()

    [positivity_score + new_positivity_score, review]
  end

  # @spec calculate_average_sentiment_value_per_word(rated_review()) :: rated_review()
  def calculate_average_sentiment_value_per_word([positivity_score, review]) do
    word_count =
      review
      |> String.split(" ")
      |> Enum.count()

    [positivity_score / word_count, review]
  end
end
