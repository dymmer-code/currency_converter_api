defmodule CurrencyConverterApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :currency_converter_api,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {CurrencyConverterApi.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, ">= 1.0.0"},
      {:tesla, "~> 1.1.0"},
      {:nebulex, "~> 1.0.0-rc.3"},

      {:excoveralls, "~> 0.10.3", only: :test},
    ]
  end

  defp aliases do
    [
      test: ["coveralls.json"]
    ]
  end
end
