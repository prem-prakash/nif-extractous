defmodule NifExtractous.MixProject do
  use Mix.Project

  @version "0.9.0"
  @source_url "https://github.com/snewcomer/nif-extractous"

  def project do
    [
      app: :nif_extractous,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      description: "A extractous rust precompiled",
      package: package(),
      deps: deps()
    ]
  end

  # When publishing a library to with precompiled NIFs to Hex,
  # is is mandatory to include a checksum file (along with other
  # necessary files in the library).
  #
  defp package do
    [
      files: [
        "lib",
        "native",
        "checksum-*.exs",
        "mix.exs"
      ],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:rustler_precompiled, "~> 0.8"},
      {:rustler, ">= 0.0.0", optional: true}
    ]
  end
end
