defmodule ExcessiveExuberanceDetector.ConsolePrinter do
  @moduledoc """
  Takes rated reviews as prepared by the `ExuberanceRater` and prepares and then
  prints them to the console.
  """

  def print_top_three_to_console(rated_reviews) do
    rated_reviews
    |> sort_reviews_desc
    |> take_top_three
    |> add_rank
    |> add_newlines_to_reviews
    |> build_display_table
    |> print_to_console
  end

  defp sort_reviews_desc(rated_reviews) do
    rated_reviews
    |> Enum.sort(:desc)
  end

  defp take_top_three(sorted_reviews) do
    sorted_reviews
    |> Enum.take(3)
  end

  defp add_rank(review) do
    review
    |> Enum.with_index(1)
    |> Enum.map(fn {[score, review], rank} -> ["##{rank}", review, score] end)
  end

  # This way the reviews will not be too long when printed to console
  defp add_newlines_to_reviews(rated_reviews) do
    rated_reviews
    |> Enum.map(&split_at_80_chars/1)
  end

  defp split_at_80_chars([rank, review, score]) do
    review_with_newlines =
      review
      |> String.split(~r/.{80}/, include_captures: true, trim: true)
      |> Enum.join("\n")

    [rank, review_with_newlines, score]
  end

  defp build_display_table(reviews) do
    title = "Top 3 Overly Positive Reviews from McKaig Chevrolet Buick"
    headers = ["Rank", "Review", "Score (Avg Per Word Positivity)"]
    rows = reviews

    TableRex.quick_render!(rows, headers, title)
  end

  defp print_to_console(table_for_display), do: IO.puts(table_for_display)
end
