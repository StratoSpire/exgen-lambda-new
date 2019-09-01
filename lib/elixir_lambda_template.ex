defmodule ElixirLambdaTemplate do
  @moduledoc """
  Documentation for ElixirLambdaTemplate.
  """

  def hello_world(request, context) when is_map(request) and is_map(context) do
    """
    Hello World!
    Request: #{Kernel.inspect(request)}
    Context: #{Kernel.inspect(context)}
    """
    |> IO.puts()

    :ok
  end
end
