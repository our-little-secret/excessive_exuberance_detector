defmodule ExcessiveExuberanceDetector.MixProject do
  use Mix.Project

  def project do
    [
      app: :excessive_exuberance_detector,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:httpoison, "~> 1.7"},
      {:floki, "~> 0.29.0"}
    ]
  end
end
