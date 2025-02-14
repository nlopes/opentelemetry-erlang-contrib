defmodule OpentelemetryPhoenix.MixProject do
  use Mix.Project

  def project do
    [
      app: :opentelemetry_phoenix,
      description: description(),
      version: "1.0.0-rc.4",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      dialyzer: [
        plt_add_apps: [:ex_unit, :mix],
        plt_core_path: "priv/plts",
        plt_local_path: "priv/plts"
      ],
      deps: deps(),
      name: "Opentelemetry Phoenix",
      docs: [
        main: "OpentelemetryPhoenix",
        extras: ["README.md"]
      ],
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      source_url:
        "https://github.com/open-telemetry/opentelemetry-erlang-contrib/tree/main/instrumentation/opentelemetry_phoenix"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  defp description do
    "Trace Phoenix requests with OpenTelemetry."
  end

  defp package do
    [
      description: "OpenTelemetry tracing for the Phoenix Framework",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" =>
          "https://github.com/open-telemetry/opentelemetry-erlang-contrib/instrumentation/opentelemetry_phoenix",
        "OpenTelemetry Erlang" => "https://github.com/open-telemetry/opentelemetry-erlang",
        "OpenTelemetry Erlang Contrib" => "https://github.com/open-telemetry/opentelemetry-erlang-contrib",
        "OpenTelemetry.io" => "https://opentelemetry.io"
      }
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:opentelemetry_api, "~> 1.0.0-rc.2"},
      {:opentelemetry_telemetry, "~> 1.0.0-beta"},
      {:telemetry, "~> 0.4 or ~> 1.0.0"},
      {:opentelemetry, "~> 1.0.0-rc.2", only: [:dev, :test]},
      {:plug, "~> 1.11", only: [:dev, :test]},
      {:ex_doc, "~> 0.24", only: [:dev], runtime: false},
      {:plug_cowboy, "~> 2.4", only: [:test]},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false}
    ]
  end
end
