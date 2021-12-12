path = Path.join(["inputs", "3.txt"])

bytes =
  File.read!(path)
  |> String.split("\n")
  |> Enum.reject(fn x -> x == "" end)

defmodule Average do
  def mode(list) do
    gb = Enum.group_by(list, & &1)
    max = Enum.map(gb, fn {_, val} -> length(val) end) |> Enum.max()
    for {key, val} <- gb, length(val) == max, do: key
  end
end

defmodule Util do
  def calc_most_common_bit(index, bytes) do
    for byte <- bytes do
      String.at(byte, index)
    end
    |> Average.mode()
    |> List.first()
  end

  def flip_string_bit(char) do
    case char do
      49 -> 48
      48 -> 49
    end
    |> to_string()
  end

  def calc_least_common_bit(index, bytes) do
    calc_most_common_bit(index, bytes)
    |> flip_string_bit()
  end

  def calc_oxygen(bytes) do
    length = String.length(Enum.at(bytes, 1))

    Enum.
  end
end

ox =
  Util.calc_oxygen(bytes)
  |> IO.inspect()

epsilon =
  Util.get_epsilon_from_gamma(gamma)
  |> IO.inspect()
