defmodule ExcessiveExuberanceDetector.ConsolePrinter.CLI do
  @moduledoc """
  Entry point for command line functionality. Configured to be used via the
  escript key inside the `project` function in mix.exs.
  """

  @doc """
  Ran by the configured escript
  """
  @spec main(any) :: :ok
  def main(_args) do
    ExcessiveExuberanceDetector.rank_reviews()
  end
end
