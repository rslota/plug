defmodule Plug.Mixfile do
  use Mix.Project

  @version "1.3.0"

  def project do
    [app: :plug,
     version: @version,
     elixir: "~> 1.2.3 or ~> 1.3",
     deps: deps(),
     package: package(),
     description: "A specification and conveniences for composable " <>
                  "modules between web applications",
     name: "Plug",
     xref: [exclude: [:ranch, :cowboy, :cowboy_req, :cowboy_router]],
     docs: [extras: ["README.md"], main: "readme",
            source_ref: "v#{@version}",
            source_url: "https://github.com/elixir-lang/plug"]]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:crypto, :logger, :mime],
     mod: {Plug, []}]
  end

  def deps do
    [{:mime, "~> 1.0"},
     {:ranch, github: "ninenines/ranch", ref: "1.3.0", optional: true, override: true},
     {:cowlib, github: "ninenines/cowlib", ref: "master", optional: true, override: true},
     {:cowboy, github: "ninenines/cowboy", ref: "2.0.0-pre.4", optional: true},
     {:ex_doc, "~> 0.12", only: :docs},
     {:inch_ex, ">= 0.0.0", only: :docs},
     {:gun, github: "ninenines/gun", ref: "master", only: :test},
     {:hackney, "~> 1.2.0", only: :test}]
  end

  defp package do
    %{licenses: ["Apache 2"],
      maintainers: ["José Valim"],
      links: %{"GitHub" => "https://github.com/elixir-lang/plug"}}
  end
end
