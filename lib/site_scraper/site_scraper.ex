defmodule ExcessiveExuberanceDetector.SiteScraper do
  alias ExcessiveExuberanceDetector.Constants

  @review_request_service Application.get_env(
                            :excessive_exuberance_detector,
                            :review_request_service
                          )

  @doc """
  Scrapes the first 5 pages of reviews for their contents from dealerrater.com
  for McKaig Chevrolet Buick
  """
  @spec scrape_reviews :: [String.t()]
  def scrape_reviews do
    get_reviews_pages()
    |> parse_reviews
  end

  @doc """
  Takes a list of URLs and returns a list of the HTML bodies.
  """
  @spec get_reviews_pages([String.t()]) :: [String.t()]
  def get_reviews_pages(pages_to_get \\ Constants.first_five_mckaig_review_page_urls()) do
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
  Strips away additional elements leaving only reviews.
  """
  @spec return_just_reviews([Floki.html_tree()]) :: [String.t()]
  def return_just_reviews(reviews) do
    reviews
    |> Enum.map(&return_just_review/1)
  end

  defp return_just_review({_tag, _class_list, [review]}), do: review

  @doc """
  Takes a URL and makes an HTTP request to get the HTML.
  """
  @spec get_single_reviews_page(String.t()) :: String.t()
  def get_single_reviews_page(url) do
    @review_request_service.get_reviews_page(url)
  end
end
