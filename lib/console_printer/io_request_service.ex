defmodule ExcessiveExuberanceDetector.ConsolePrinter.IORequestService do
  @moduledoc """
  Handles printing to console.
  """

  def puts(table_for_display), do: IO.puts(table_for_display)
end
