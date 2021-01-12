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
  Gets the top 3 overly positive reviews from the first 5 McKaig review pages
  and prints the results to the console
  """
  def rank_reviews do
    SiteScraper.scrape_reviews()
    |> ExuberanceRater.rate_reviews()
    |> ConsolePrinter.print_top_three_to_console()
  end
end
