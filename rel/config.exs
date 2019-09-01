~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :elixir_lambda_template,
    default_environment: :lambda

environment :lambda do
  set include_erts: true
  set include_src: false
  set cookie: :test
  set include_system_libs: true

  # Distillery forces the ERTS into 'distributed' mode which will
  # attempt to connect to EPMD. This is not supported behavior in the
  # AWS Lambda runtime because our process isn't allowed to connect to
  # other ports on this host.
  #
  # So '-start_epmd false' is set so the ERTS doesn't try to start EPMD.
  # And '-epmd_module' is set to use a no-op implementation of EPMD
  set erl_opts: "-start_epmd false -epmd_module Elixir.EPMD.StubClient"
end

release :elixir_lambda_template do
  set version: current_version(:elixir_lambda_template)
  set applications: [
    :runtime_tools, :aws_lambda_elixir_runtime
  ]
end
