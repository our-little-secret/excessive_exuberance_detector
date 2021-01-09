defmodule ExcessiveExuberanceDetector.SiteScraper.ReviewRequestService do
  @moduledoc """
  Handles HTTP requests to review sites
  """

  def get_reviews_page(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      non_200_response ->
        IO.puts(
          "There was a problem with the review request. Received non 200 response: #{
            inspect(non_200_response)
          }"
        )
    end
  end
end
