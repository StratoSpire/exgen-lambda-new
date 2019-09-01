defmodule ElixirLambdaTemplateTest do
  use ExUnit.Case
  doctest ElixirLambdaTemplate

  test "greets the world" do
    assert ElixirLambdaTemplate.hello() == :world
  end
end
