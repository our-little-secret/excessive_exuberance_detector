defmodule ExcessiveExuberanceDetector.ConsolePrinter do
  @moduledoc """
  Takes rated reviews as prepared by the `ExuberanceRater` processes them further
  and then prints them to the console.
  """
  alias ExcessiveExuberanceDetector.ExuberanceRater

  @io_request_service Application.get_env(
                        :excessive_exuberance_detector,
                        :io_request_service
                      )

  @doc """
  Takes a list of rated reviews, processes those reviews, and prints them to the
  console.
  """
  @spec print_top_three_to_console(ExuberanceRater.rated_reviews()) :: :ok
  def print_top_three_to_console(rated_reviews) do
    rated_reviews
    |> sort_reviews_desc
    |> take_top_three
    |> add_rank_and_rearrange_order
    |> add_newlines_to_reviews
    |> build_display_table
    |> print_to_console
  end

  @spec sort_reviews_desc(ExuberanceRater.rated_reviews()) :: ExuberanceRater.rated_reviews()
  defp sort_reviews_desc(rated_reviews) do
    rated_reviews
    |> Enum.sort(:desc)
  end

  @spec take_top_three(ExuberanceRater.rated_reviews()) :: ExuberanceRater.rated_reviews()
  defp take_top_three(sorted_reviews) do
    sorted_reviews
    |> Enum.take(3)
  end

  # Adds the rank as a string in prep for the text table
  @spec add_rank_and_rearrange_order(ExuberanceRater.rated_reviews()) :: [any]
  defp add_rank_and_rearrange_order(review) do
    review
    |> Enum.with_index(1)
    |> Enum.map(fn {[score, review], rank} -> ["##{rank}", review, score] end)
  end

  # This way the reviews will not be too long when printed to console
  @spec add_newlines_to_reviews([any]) :: [any]
  defp add_newlines_to_reviews(rated_reviews) do
    rated_reviews
    |> Enum.map(&split_at_80_chars/1)
  end

  @spec split_at_80_chars([any]) :: [any]
  defp split_at_80_chars([rank, review, score]) do
    review_with_newlines =
      review
      |> String.split(~r/.{80}/, include_captures: true, trim: true)
      |> Enum.join("\n")

    [rank, review_with_newlines, score]
  end

  @spec build_display_table([any]) :: String.t()
  defp build_display_table(reviews) do
    title = "Top 3 Overly Positive Reviews from McKaig Chevrolet Buick"
    headers = ["Rank", "Review", "Score (Avg Per Word Positivity)"]
    rows = reviews

    TableRex.quick_render!(rows, headers, title)
  end

  @spec print_to_console(String.t()) :: :ok
  defp print_to_console(table_for_display), do: @io_request_service.puts(table_for_display)
end
