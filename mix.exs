defmodule Transdep.MixProject do
  use Mix.Project

  def project do
    [
      app: :transdep,
      version: "0.1.0",
      language: :erlang,
      erlc_options: erlc_options(),
      deps: deps()
    ]
  end


  def application do
    [
      mod: {:transdep_app, []}
    ]
  end


  defp erlc_options do
    [
      :debug_info,
      :warnings_as_errors
    ]
  end

  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
      {:hackney, "~> 1.15.2"},
      {:ssl_verify_fun, "~> 1.1.5", manager: :rebar3, override: true}
    ]
  end
end
