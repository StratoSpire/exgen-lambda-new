defmodule <%= module %>.MixProject do
  use Mix.Project

  def project do
    [
      app: :<%= app_name %>,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      default_release: :aws_lambda_elixir_runtime,
      releases: [
        <%= app_name %>: [
          include_executables_for: [:unix],
          applications: [
            runtime_tools: :permanent,
            aws_lambda_elixir_runtime: :permanent
          ]
        ],
      ]
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {
        :aws_lambda_elixir_runtime,
        git: "https://github.com/StratoSpire/aws-lambda-elixir-runtime.git",
        sparse: "elixir_runtime",
        ref: "388089b"
      },
    ]
  end
end
