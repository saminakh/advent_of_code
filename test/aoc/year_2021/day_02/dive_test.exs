defmodule Aoc.Year2021.Day02.DiveTest do
  use Aoc.DayCase
  doctest Aoc.Year2021.Day02.Dive, import: true

  alias Aoc.Year2021.Day02.Dive, as: Day02

  describe "part_1/1" do
    test "examples" do
    end

    @tag day: 02, year: 2021
    test "input", %{input: input} do
      assert input |> Day02.part_1() == 1_427_868
    end
  end

  describe "part_2/1" do
    test "examples" do
    end

    @tag day: 02, year: 2021
    test "input", %{input: input} do
      assert input |> Day02.part_2() == 1_568_138_742
    end
  end
end
