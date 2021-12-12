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

  def calc_gamma(bytes) do
    length = String.length(Enum.at(bytes, 1))

    Enum.to_list(0..(length - 1))
    |> Enum.map(&calc_most_common_bit(&1, bytes))
    |> Enum.reduce("", fn element, acc -> acc <> element end)
  end

  def flip_string_bit(char) do
    case char do
      49 -> 48
      48 -> 49
    end
  end

  def get_epsilon_from_gamma(gamma) do
    for char <- String.to_charlist(gamma) do
      flip_string_bit(char)
    end
    |> to_string
  end
end

gamma =
  Util.calc_gamma(bytes)
  |> IO.inspect()

epsilon =
  Util.get_epsilon_from_gamma(gamma)
  |> IO.inspect()
