defmodule ExcessiveExuberanceDetectorTest.ExuberanceRaterTest do
  use ExUnit.Case
  alias ExcessiveExuberanceDetector.ExuberanceRater

  describe "rate_reviews" do
    test "takes a list of reviews and returns them rated" do
      actual =
        ExuberanceRater.rate_reviews([
          "This is great. See what I mean.",
          "This is good. Quite good.",
          "This is incredibly bad. So so so bad."
        ])

      expected = [
        [0.42857142857142855, "This is great. See what I mean."],
        [1.2, "This is good. Quite good."],
        [-0.75, "This is incredibly bad. So so so bad."]
      ]

      assert actual == expected
    end
  end

  describe "rate_single_review" do
    test "takes a review and returns that review rated" do
      actual =
        ExuberanceRater.rate_single_review(
          "Here is a review that will be rated. Is it a good review? Or is it a bad review? The ending will say it was very good!"
        )

      expected = [
        0.14814814814814814,
        "Here is a review that will be rated. Is it a good review? Or is it a bad review? The ending will say it was very good!"
      ]

      assert actual == expected
    end
  end

  describe "perform_sentiment_analysis" do
    test "takes a rated review and returns that review with an updated raw valence score" do
      actual =
        ExuberanceRater.perform_sentiment_analysis([
          0.0,
          "It was amazingly good! Yes o yes. See it!"
        ])

      expected = [5.0, "It was amazingly good! Yes o yes. See it!"]

      assert actual == expected
    end
  end

  describe "calculate_average_sentiment_value_per_word" do
    test "takes a review with a raw valence score and returns recalculated score that is a positivity value per word" do
      actual =
        ExuberanceRater.calculate_average_sentiment_value_per_word([
          5.0,
          "It was amazingly good! Yes o yes. See it!"
        ])

      expected = [0.5555555555555556, "It was amazingly good! Yes o yes. See it!"]

      assert actual == expected
    end

    test "returns an empty string with a zero rating unchanged" do
      actual =
        ExuberanceRater.calculate_average_sentiment_value_per_word([
          0.0,
          ""
        ])

      expected = [0.0, ""]

      assert actual == expected
    end
  end
end
