defmodule ExCdrPusher.Mixfile do
  use Mix.Project

  def project do
    [app: :excdr_pusher,
     version: "0.1.2",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     # hex
     description: description,
     package: package,
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :exrm, :swab, :sqlitex, :instream, :postgrex, :ecto, :logger_file_backend, :exrm_deb],
     mod: {ExCdrPusher, []}]
  end


  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
     {:ex_doc, "~> 0.13.0", only: :dev},
     {:exrm, "~> 1.0.8"},
     {:exrm_deb, "~> 0.0.7"},
     {:sqlitex, "~> 1.0.1"},
     # {:sqlitex, path: "../sqlitex"},
     {:postgrex, ">= 0.0.0"},
     {:ecto, "~> 2.0.5"},
     {:logger_file_backend, "0.0.7"},
     {:instream, "~> 0.13"},
     {:swab, github: "crownedgrouse/swab", branch: "master"}
    ]
  end

  defp description, do: "Push FreeSWITCH CDRS from Sqlite to PostgreSQL & InfluxDB"

  defp package do
    [
      name: :excdr_pusher,
      license_file: "LICENSE",
      external_dependencies: [],
      maintainers: ["Areski Belaid"],
      vendor: "Areski Belaid",
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/areski/excdr-pusher",
        "Homepage" => "https://github.com/areski/excdr-pusher"
      }
    ]
  end
end
