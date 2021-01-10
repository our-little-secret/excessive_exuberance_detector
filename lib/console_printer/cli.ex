defmodule ExcessiveExuberanceDetector.ConsolePrinter.CLI do
  def main(_args) do
    # options = [switches: [average_sentiment: :boolean], aliases: [as: :average_sentiment]]
    #
    # {opts, _, _} = OptionParser.parse(args, options)
    ExcessiveExuberanceDetector.rank_reviews
  end
end
