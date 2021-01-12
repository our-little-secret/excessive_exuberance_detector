defmodule ExcessiveExuberanceDetector.ConsolePrinter.IORequestServiceMock do
  @moduledoc """
  Mock for `IORequestService`. Used for testing. Set in `config/test.exs`.
  """

  @doc """
  Mock that just returns what it was given instead of printing to IO
  during tests.
  """
  def puts(table_for_display), do: table_for_display
end
