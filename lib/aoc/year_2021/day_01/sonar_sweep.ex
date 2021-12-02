defmodule Aoc.Year2021.Day01.SonarSweep do
  @spec part_1(list(integer)) :: integer
  def part_1(input) do
    count_increase(input, 0)
  end

  @spec part_1(list(integer)) :: integer
  def part_2(input) do
    count_sum_increase(input, 0)
  end

  defp count_increase([_a], count), do: count

  defp count_increase([a, b | remaining], count) when b > a,
    do: count_increase([b | remaining], count + 1)

  defp count_increase([_a, b | remaining], count),
    do: count_increase([b | remaining], count)

  defp count_sum_increase([_a, _b, _c], count), do: count

  defp count_sum_increase([a, b, c, d | remaining], count) when b + c + d > a + b + c,
    do: count_sum_increase([b, c, d | remaining], count + 1)

  defp count_sum_increase([_a, b, c, d | remaining], count),
    do: count_sum_increase([b, c, d | remaining], count)
end
