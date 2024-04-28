defmodule FlyteTest do
  use ExUnit.Case
  doctest Flyte

  test "greets the world" do
    assert Flyte.hello() == :world
  end
end
