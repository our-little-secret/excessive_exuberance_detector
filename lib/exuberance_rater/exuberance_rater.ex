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
    |> calculate_exclamation_point_value
  end

  def set_initial_score(review), do: [0, review]

  def calculate_exclamation_point_value([positivity_score, review]) do
    exclamation_score =
      review
      |> split_string_by_character
      |> count_exclamation_points

    [positivity_score + exclamation_score, review]
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
