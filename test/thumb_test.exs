defmodule ThumbTest do
  use ExUnit.Case
  doctest Thumb

  test "greets the world" do
    assert Thumb.hello() == :world
  end
end
