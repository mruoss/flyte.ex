defmodule Flyte.MixProject do
  use Mix.Project

  @app :flyte
  @source_url "https://github.com/mruoss/flyte.ex"
  @version "2.0.1"

  def project do
    [
      app: @app,
      description:
        "Elixir files generated from Flyte's protobuf files using protobuf-elixir.",
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:protobuf, "~> 0.16.0"},
      {:grpc, "~> 0.11.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: @app,
      maintainers: ["Michael Ruoss"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @source_url,
        "Sponsor" => "https://github.com/sponsors/mruoss"
      },
      files: ["lib", "mix.exs", "README*", "LICENSE*"]
    ]
  end
end
