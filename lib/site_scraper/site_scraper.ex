defmodule ExcessiveExuberanceDetector.SiteScraper do
  alias ExcessiveExuberanceDetector.Constants

  @review_request_service Application.get_env(
                            :excessive_exuberance_detector,
                            :review_request_service
                          )

  def scrape_reviews do
    get_reviews_pages()
    |> parse_reviews
  end

  @spec get_reviews_pages([String.t()]) :: [String.t()]
  def get_reviews_pages(pages_to_get \\ Constants.first_five_mckaig_review_page_urls()) do
    pages_to_get
    |> Enum.map(&get_single_reviews_page/1)
  end

  def parse_reviews(review_pages) do
    review_pages
    |> Enum.map(&parse_reviews_from_single_page/1)
    |> List.flatten()
  end

  def parse_reviews_from_single_page(reviews_page_html_body) do
    reviews_page_html_body
    |> Floki.parse_document!()
    |> Floki.find(".review-content")
    |> return_just_reviews
  end

  def return_just_reviews(reviews) do
    reviews
    |> Enum.map(&return_just_review/1)
  end

  defp return_just_review({_tag, _class_list, [review]}), do: review

  defp get_single_reviews_page(url) do
    @review_request_service.get_reviews_page(url)
  end
end
