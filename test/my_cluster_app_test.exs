defmodule MyClusterAppTest do
  use ExUnit.Case
  doctest MyClusterApp

  test "greets the world" do
    assert MyClusterApp.hello() == :world
  end
end
