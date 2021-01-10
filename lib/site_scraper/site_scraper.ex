defmodule ExcessiveExuberanceDetector.SiteScraper do
  @moduledoc """
  Handles scraping reviews from dealerrater.com for McKaig Chevrolet Buick and
  prepares them to be passed to the `ExuberanceRater` to be rated.
  """
  alias ExcessiveExuberanceDetector.Constants

  @review_request_service Application.get_env(
                            :excessive_exuberance_detector,
                            :review_request_service
                          )

  @doc """
  Scrapes the first 5 pages of reviews for the review contents from dealerrater.com
  for McKaig Chevrolet Buick.
  """
  @spec scrape_reviews :: [String.t()]
  def scrape_reviews do
    Constants.first_five_mckaig_review_page_urls()
    |> get_review_pages
    |> parse_reviews
  end

  @doc """
  Takes a list of URLs and returns a list of the HTML bodies.
  """
  @spec get_review_pages([String.t()]) :: [String.t()]
  def get_review_pages(pages_to_get) do
    pages_to_get
    |> Enum.map(&get_single_reviews_page/1)
  end

  @doc """
  Takes a list of HTML bodies and returns a list of reviews contained in those bodies.
  """
  @spec parse_reviews([String.t()]) :: [String.t()]
  def parse_reviews(review_pages) do
    review_pages
    |> Enum.map(&parse_reviews_from_single_page/1)
    |> List.flatten()
  end

  @doc """
  Takes in raw HTML and parses it to return only the text content of the reviews.
  """
  @spec parse_reviews_from_single_page(String.t()) :: [String.t()]
  def parse_reviews_from_single_page(reviews_page_html_body) do
    reviews_page_html_body
    |> Floki.parse_document!()
    |> Floki.find(".review-content")
    |> return_just_reviews
  end

  @doc """
  Takes a list of Floki HTML tree representations and returns just the content
  of the reviews.
  """
  @spec return_just_reviews([Floki.html_tree()]) :: [String.t()]
  def return_just_reviews(reviews) do
    reviews
    |> Enum.map(&return_just_review/1)
  end

  @doc """
  Takes a Floki HTML tree representation and returns just the review content
  while stripping out display characters.
  """
  @spec return_just_review(Floki.html_tree()) :: String.t()
  def return_just_review({_tag, _class_list, [review]}) do
    review
    |> replace_return_newlines_with_spaces
    |> replace_apostrophe_with_single_quote
    |> String.trim
  end

  defp replace_return_newlines_with_spaces(review) do
    review
    |> String.replace("\r\n", " ")
  end

  # This was causing an issue with parsing.
  defp replace_apostrophe_with_single_quote(review) do
    review
    |> String.replace("’", "'")
  end

  @doc """
  Takes a URL and makes an HTTP request to get the HTML.
  """
  @spec get_single_reviews_page(String.t()) :: String.t()
  def get_single_reviews_page(url) do
    @review_request_service.get_reviews_page(url)
  end
end
