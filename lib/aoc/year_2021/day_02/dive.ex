defmodule Aoc.Year2021.Day02.Dive do
  @moduledoc """
  ## --- Day 2: Dive! --- 

  Now, you need to figure out how to pilot this thing. 

  It seems like the submarine can take a series of commands like `forward 1`,
  `down 2`, or `up 3`: 

  - `forward X` increases the horizontal position by `X` units. 
  - `down X`*increases* the depth by `X` units. 
  - `up X`*decreases* the depth by `X` units. 
  Note that since you're on a submarine, `down` and `up` affect your *depth*, and
  so they have the opposite result of what you might expect. 

  The submarine seems to already have a planned course (your puzzle input). You
  should probably figure out where it's going. For example: 

  `forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  `Your horizontal position and depth both start at `0`. The steps above would then
  modify them as follows: 

  - `forward 5` adds `5` to your horizontal position, a total of `5`. 
  - `down 5` adds `5` to your depth, resulting in a value of `5`. 
  - `forward 8` adds `8` to your horizontal position, a total of `13`. 
  - `up 3` decreases your depth by `3`, resulting in a value of `2`. 
  - `down 8` adds `8` to your depth, resulting in a value of `10`. 
  - `forward 2` adds `2` to your horizontal position, a total of `15`. 
  After following these instructions, you would have a horizontal position of `15`
  and a depth of `10`. (Multiplying these together produces `*150*`.) 

  Calculate the horizontal position and depth you would have after following the
  planned course. *What do you get if you multiply your final horizontal position
  by your final depth?* 


  """

  @doc """

  """
  def part_1(input) do
    [h, d] =
      input
      |> String.split("\n")
      |> Enum.map(&parse_move/1)
      |> Enum.reduce(fn [h1, d1], [h2, d2] ->
        [h1 + h2, d1 + d2]
      end)

    h * d
  end

  defp parse_move("forward " <> amt), do: [String.to_integer(amt), 0]
  defp parse_move("down " <> amt), do: [0, String.to_integer(amt)]
  defp parse_move("up " <> amt), do: [0, -String.to_integer(amt)]

  @doc """

  """
  def part_2(input) do
    [h, d, _a] =
      input
      |> String.split("\n")
      |> Enum.map(&parse_move/1)
      |> Enum.reduce([0, 0, 0], fn [h1, d1], [h2, d2, aim] ->
        case h1 do
          0 ->
            [h2, d2, aim + d1]

          _ ->
            [h1 + h2, d2 + aim * h1, aim]
        end
      end)

    h * d
  end
end
