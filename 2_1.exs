path = Path.join(["inputs", "2.txt"])

instructions =
  File.read!(path)
  |> String.split("\n")
  |> Enum.reject(fn x -> x == "" end)

defmodule Util do
  def process_instruction(instruction, {x, y} = _current_position) do
    case String.split(instruction, " ") do
      ["forward", distance] -> {x + String.to_integer(distance), y}
      ["down", distance] -> {x, y + String.to_integer(distance)}
      ["up", distance] -> {x, y - String.to_integer(distance)}
    end
  end
end

Enum.reduce(instructions, {0, 0}, &Util.process_instruction/2)
|> (fn {x, y} -> x * y end).()
|> IO.inspect()
