defmodule GoscopeTest do
  use ExUnit.Case
  doctest Goscope

  test "greets the world" do
    assert Goscope.hello() == :world
  end
end
