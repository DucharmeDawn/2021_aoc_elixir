defmodule Util do
  def did_increase(enum, index) do
    {a1, _} = Enum.at(enum, index - 3)
    {b1, _} = Enum.at(enum, index - 2)
    {c1, _} = Enum.at(enum, index - 1)

    {a2, _} = Enum.at(enum, index - 2)
    {b2, _} = Enum.at(enum, index - 1)
    {c2, _} = Enum.at(enum, index)

    a1 + b1 + c1 < a2 + b2 + c2
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
