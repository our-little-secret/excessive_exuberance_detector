defmodule ExcessiveExuberanceDetector.ConsolePrinter.CLI do
  @moduledoc """
  Entry point for command line functionality.
  """

  @doc """
  Run by typing `./excessive_exuberance_detector` on the CLI in the context of
  the root of this project
  """
  @spec main(any) :: :ok
  def main(_args) do
    # options = [switches: [average_sentiment: :boolean], aliases: [as: :average_sentiment]]
    #
    # {opts, _, _} = OptionParser.parse(args, options)
    ExcessiveExuberanceDetector.rank_reviews
  end
end
