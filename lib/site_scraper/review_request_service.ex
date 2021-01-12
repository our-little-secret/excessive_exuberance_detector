defmodule ExcessiveExuberanceDetector.SiteScraper.ReviewRequestService do
  @moduledoc """
  Handles HTTP requests to review sites.
  """

  @doc """
  Takes a URL and makes an HTTP request to get the HTML.
  """
  @spec get_reviews_page(String.t()) :: String.t() | :ok
  def get_reviews_page(url) do
    IO.puts("Scraping #{get_page(url)}...")

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

  defp get_page(url), do: url |> String.split("/") |> Enum.at(5)
end
