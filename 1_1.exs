defmodule Util do
  def did_increase(enum, index) do
    last = Enum.at(enum, index - 1)
    last != nil && Enum.at(enum, index) > last
  end
end

path = Path.join(["inputs", "1.txt"])

depths =
  File.read!(path)
  |> String.split("\n")
  |> Enum.reject(fn x -> x == "" end)
  |> Enum.map(&String.to_integer/1)
  |> Enum.with_index()

Enum.reject(depths, fn {_element, index} -> !Util.did_increase(depths, index) end)
|> Enum.count()
|> IO.inspect()
