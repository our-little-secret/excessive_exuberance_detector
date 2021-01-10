defmodule ExcessiveExuberanceDetectorTest.SiteScraperTest do
  use ExUnit.Case
  alias ExcessiveExuberanceDetector.{Constants, SiteScraper}

  describe "scrape_reviews" do
    test "scrapes reviews from first 5 review pages of McKaig Chevrolet Buick and parses scraped reviews returning list of the review content" do
      actual = SiteScraper.scrape_reviews()

      expected = [
               "Started my process online, then came into the dealership to finish up everything and drove off in my new Malibu! We spent only a few hours at the dealership, but the people were so friendly it didn't seem like that long. Shonna was AMAZING!!!!!!",
               "Yeah they were ok. Probably would go elsewhere next time.",
               "They were the worst ever! I'll never go back.",
               "Mariela was so helpful! She made the whole process so easy and fast she also helped me save money! Thank you Mariela! You are Awesome!",
               "Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire Mckaig staff for such an amazing job . I love my Buick Encore"
             ]

      assert actual == expected
    end
  end

  describe "get_review_pages" do
    test "gets the HTML content of the given URLs" do
      actual = SiteScraper.get_review_pages(Constants.first_five_mckaig_review_page_urls)

      expected = [
              "<!doctype html>\n      <html>\n      <body>\n        <section id=\"review-entry\">\n          <p class=\"review-content\">Started my process online, then came into the dealership to finish up everything and drove off in my new Malibu! We spent only a few hours at the dealership, but the people were so friendly it didn’t seem like that long. Shonna was AMAZING!!!!!! </p>\n          <a href=\"http://github.com/philss/floki\">Github page</a>\n          <span data-model=\"user\">philss</span>\n        </section>\n      </body>\n    </html>",
              "<!doctype html>\n      <html>\n      <body>\n        <section id=\"review-entry\">\n          <p class=\"review-content\">Yeah they were ok. Probably would go elsewhere next time.</p>\n          <a href=\"http://github.com/philss/floki\">Github page</a>\n          <span data-model=\"user\">philss</span>\n        </section>\n      </body>\n    </html>",
              "<!doctype html>\n      <html>\n      <body>\n        <section id=\"review-entry\">\n          <p class=\"review-content\">They were the worst ever! I'll never go back.</p>\n          <a href=\"http://github.com/philss/floki\">Github page</a>\n          <span data-model=\"user\">philss</span>\n        </section>\n      </body>\n    </html>",
              "<!doctype html>\n      <html>\n      <body>\n        <section id=\"review-entry\">\n          <p class=\"review-content\">Mariela was so helpful! She made the whole process so easy and fast she also helped me save money! Thank you Mariela! You are Awesome! </p>\n          <a href=\"http://github.com/philss/floki\">Github page</a>\n          <span data-model=\"user\">philss</span>\n        </section>\n      </body>\n    </html>",
              "<!doctype html>\n      <html>\n      <body>\n        <section id=\"review-entry\">\n          <p class=\"review-content\">Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire Mckaig staff for such an amazing job . I love my Buick Encore </p>\n          <a href=\"http://github.com/philss/floki\">Github page</a>\n          <span data-model=\"user\">philss</span>\n        </section>\n      </body>\n    </html>"
            ]

      assert actual == expected
    end
  end

  describe "parse_reviews" do
    test "given a list of HTML representing the different pages of reviews returns a list of reviews (just review content)" do
    end
  end

  describe "parse_reviews_from_single_page" do
    test "parses reviews given an HTML document that can be parsed and contains the .review-content class" do

    end
  end

  describe "return_just_reviews" do
    test "returns no reviews when none are passed (as is the result when Floki.find does not match)" do
      actual = SiteScraper.return_just_reviews([])

      expected = []

      assert actual == expected
    end
  end

  describe "return_just_review" do
    test "returns just the review content given a Floki html tree representation" do

    end
  end

  describe "get_single_reviews_page" do
    test "gets the HTML content of a page given a URL" do
    end
  end
end
