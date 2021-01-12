defmodule ExcessiveExuberanceDetectorTest.ConsolePrinterTest do
  use ExUnit.Case
  alias ExcessiveExuberanceDetector.ConsolePrinter

  describe "print_top_three_to_console" do
    test "turns a list of rated reviews into a sorted and ranked top 3 text based table" do
      actual =
        ConsolePrinter.print_top_three_to_console([
          [
            0.93453453,
            "Started my process online, then came into the dealership to finish up everything and drove off in my new Malibu! We spent only a few hours at the dealership, but the people were so friendly it didn't seem like that long. Shonna was AMAZING!!!!!!"
          ],
          [0.79795965, "Yeah they were ok. Probably would go elsewhere next time."],
          [0.49897934, "They were the worst ever! I'll never go back."],
          [
            0.67096764,
            "Mariela was so helpful! She made the whole process so easy and fast she also helped me save money! Thank you Mariela! You are Awesome!"
          ],
          [
            0.88344535,
            "Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire Mckaig staff for such an amazing job . I love my Buick Encore"
          ]
        ])

      # I don't like this. With more time I would have found a better solution.
      # I wanted this to look as it does in the console but formatting
      # for readability here in the test means changing the content and making
      # the test fail.
      expected =
        "+---------------------------------------------------------------------------------------------------------------------------+\n|                                 Top 3 Overly Positive Reviews from McKaig Chevrolet Buick                                 |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n| Rank | Review                                                                           | Score (Avg Per Word Positivity) |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n| #1   | Started my process online, then came into the dealership to finish up everything | 0.93453453                      |\n|      |  and drove off in my new Malibu! We spent only a few hours at the dealership, bu |                                 |\n|      | t the people were so friendly it didn't seem like that long. Shonna was AMAZING! |                                 |\n|      | !!!!!                                                                            |                                 |\n| #2   | Mckaig is the dealership for the people. Thanks you Eric Goodess and the entire  | 0.88344535                      |\n|      | Mckaig staff for such an amazing job . I love my Buick Encore                    |                                 |\n| #3   | Yeah they were ok. Probably would go elsewhere next time.                        | 0.79795965                      |\n+------+----------------------------------------------------------------------------------+---------------------------------+\n"

      assert actual == expected
    end
  end
end
