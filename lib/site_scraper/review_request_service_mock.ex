defmodule ExcessiveExuberanceDetector.SiteScraper.ReviewRequestServiceMock do
  @moduledoc """
  Mock for `ReviewRequestService`. Used for testing. Set in `config/test.exs`.
  """

  def get_reviews_page(url) do
    cond do
      is_url_page_number?(1, url) ->
        most_overly_positive_review()
        |> fake_review_page()

      is_url_page_number?(2, url) ->
        ok_review()
        |> fake_review_page()

      is_url_page_number?(3, url) ->
        poor_review()
        |> fake_review_page()

      is_url_page_number?(4, url) ->
        third_most_overly_positive_review()
        |> fake_review_page()

      is_url_page_number?(5, url) ->
        second_most_overly_positive_review()
        |> fake_review_page()
    end
  end

  defp is_url_page_number?(page_number, url) do
    String.contains?(url, "page#{page_number}")
  end

  defp most_overly_positive_review do
    "Started my process online, then came into the dealership to finish up everything and drove off in my new Malibu! We spent only a few hours at the dealership, but the people were so friendly it didn’t seem like that long. Shonna was AMAZING!!!!!! "
  end

  defp second_most_overly_positive_review do
    "Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire Mckaig staff for such an amazing job . I love my Buick Encore "
  end

  defp third_most_overly_positive_review do
    "Mariela was so helpful! She made the whole process so easy and fast she also helped me save money! Thank you Mariela! You are Awesome! "
  end

  defp ok_review do
    "Yeah they were ok. Probably would go elsewhere next time."
  end

  defp poor_review do
    "They were the worst ever! I'll never go back."
  end

  defp fake_review_page(review_content) do
    "<!doctype html>
      <html>
      <body>
        <section id=\"review-entry\">
          <p class=\"review-content\">#{review_content}</p>
          <a href=\"http://github.com/philss/floki\">Github page</a>
          <span data-model=\"user\">philss</span>
        </section>
      </body>
    </html>"
  end
end
