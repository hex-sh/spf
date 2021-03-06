defmodule Spf.Mixfile do
  use Mix.Project

  def project do
    [app: :spf,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     deps: deps,
     package: package]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.10", only: :dev}]
  end

  defp description do
    """
    SPF implementation in Elixir.
    """
  end

  defp package do
    [maintainers: ["Laurens Duijvesteijn"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/hex-sh/spf"}]
  end
end
