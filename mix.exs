defmodule ExCdrPusher.Mixfile do
  use Mix.Project

  def project do
    [app: :excdr_pusher,
     version: "0.2.3",
     elixir: "~> 1.4.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: description(),
     package: package(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [mod: {ExCdrPusher, []},
     extra_applications: [:logger]]
  end

  # Dependencies
  defp deps do
    [
     {:ex_doc, "~> 0.15.1", only: :dev},
     {:distillery, "~> 1.4"},
     # {:sqlitex, path: "../sqlitex"},
     {:sqlitex, "~> 1.3.2"},
     {:ecto, "~> 2.1.4"},
     {:postgrex, ">= 0.0.0"},
     {:logger_file_backend, "0.0.9"},
     {:instream, "~> 0.15"},
     {:swab, github: "crownedgrouse/swab", branch: "master"},
     {:timex, "~> 3.1.13"},
     {:timex_ecto, "~> 3.1.1"},
     {:tzdata, "~> 0.5.11"}
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
