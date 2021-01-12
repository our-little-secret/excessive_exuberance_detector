defmodule ExcessiveExuberanceDetectorTest do
  use ExUnit.Case

  describe "rank_reviews" do
    test "Gets the top 3 overly positive reviews from the first 5 McKaig review pages and prints the results to the console" do
      actual = ExcessiveExuberanceDetector.rank_reviews()

      expected =
        "+---------------------------------------------------------------------------------------------------------------------------+\n|                                 Top 3 Overly Positive Reviews from McKaig Chevrolet Buick                                 |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n| Rank | Review                                                                           | Score (Avg Per Word Positivity) |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n| #1   | Mariela was so helpful! She made the whole process so easy and fast she also hel | 0.44                            |\n|      | ped me save money! Thank you Mariela! You are Awesome!                           |                                 |\n| #2   | Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire  | 0.3333333333333333              |\n|      | Mckaig staff for such an amazing job . I love my Buick Encore                    |                                 |\n| #3   | Started my process online, then came into the dealership to finish up everything | 0.18181818181818182             |\n|      |  and drove off in my new Malibu! We spent only a few hours at the dealership, bu |                                 |\n|      | t the people were so friendly it didn't seem like that long. Shonna was AMAZING! |                                 |\n|      | !!!!!                                                                            |                                 |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n"

      assert actual == expected
    end
  end
end
