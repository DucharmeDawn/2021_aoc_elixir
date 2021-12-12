path = Path.join(["inputs", "2.txt"])

instructions =
  File.read!(path)
  |> String.split("\n")
  |> Enum.reject(fn x -> x == "" end)

defmodule Util do
  def process_instruction(instruction, {x, y, aim} = _current_position) do
    case String.split(instruction, " ") do
      ["forward", distance] ->
        {x + String.to_integer(distance), y + String.to_integer(distance) * aim, aim}

      ["down", distance] ->
        {x, y, aim + String.to_integer(distance)}

      ["up", distance] ->
        {x, y, aim - String.to_integer(distance)}
    end
  end
end

Enum.reduce(instructions, {0, 0, 0}, &Util.process_instruction/2)
|> (fn {x, y, _aim} -> x * y end).()
|> IO.inspect()
