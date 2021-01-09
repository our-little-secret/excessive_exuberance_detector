defmodule ExcessiveExuberanceDetector do
  @moduledoc """
  The entry point for running this app.
  """

  alias ExcessiveExuberanceDetector.{
    ConsolePrinter,
    ExuberanceRater,
    SiteScraper
  }

  @doc """
  Get the top 3 overly positive reviews from the first 5 McKaig review pages

  ## Examples

      iex> ExcessiveExuberanceDetector.rank_reviews()
      -----------------------------------------------
      |        Top 3 Overly Positive Reviews        |
      |                  ----------                 |
      | #1. It was the best service ever!!!!!!!!    |
      | #2. Amazing service!                        |
      | #3. Helpful staff.                          |
      _______________________________________________

  """
  def rank_reviews do
    SiteScraper.scrape_reviews()
    |> ExuberanceRater.rate_reviews()
    |> ConsolePrinter.print_top_three_to_console()
  end
end
