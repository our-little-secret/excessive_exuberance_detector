defmodule ExcessiveExuberanceDetector.Constants do
  @moduledoc """
  Collected constants for use throughout the codebase.
  """

  @spec first_five_mckaig_review_page_urls() :: [String.t()]
  def first_five_mckaig_review_page_urls do
    Enum.map(1..5, fn page -> mckaig_reviews_page_url(page) end)
  end

  defp mckaig_reviews_page_url(page) do
    "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{
      page
    }/"
  end
end
