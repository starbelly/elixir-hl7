defmodule HL7.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_hl7,
      version: String.trim(File.read!("./VERSION")),
      description: "An Elixir library for working with HL7 v2.x healthcare data",
      source_url: github_link(),
      package: package(),
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer_opts(),
      docs: [
        extras: ["README.md"],
        main: "readme"
      ]
    ]
  end

  defp github_link() do
    "https://github.com/HCA-Healthcare/elixir-hl7"
  end

  defp package() do
    [
      name: "elixir_hl7",
      files: ~w(lib .formatter.exs mix.exs benchmark.exs README* LICENSE* VERSION*),
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => github_link()},
      maintainers: ["Scott Southworth", "Bryan Hunter"]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:benchee, "~> 0.13.1", only: :dev},
      {:dialyxir, "~> 1.0.0-rc7", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:junit_formatter, "~> 3.0", only: :test},
      {:propcheck, "~> 1.1", only: [:test, :dev]}
    ]
  end

  defp dialyzer_opts do
    [
      plt_add_apps: [:mix, :ex_unit],
      remove_defaults: [:unknown],
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/hl7.plt"}
    ]
  end
end
