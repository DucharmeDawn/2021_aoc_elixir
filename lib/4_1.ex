path = Path.join(["inputs", "4.txt"])

defmodule Bingo do
  def board_has_win(board, numbers_called) do
    rows =
      board
      |> IO.inspect()

    columns =
      for index <- 0..length(board) do
        Enum.map(board, fn row -> row[index] end)
      end

    diagonals = [
      [
        board[0][0],
        board[1][1],
        board[2][2],
        board[3][3],
        board[4][4]
      ],
      [
        board[0][4],
        board[1][3],
        board[2][2],
        board[3][1],
        board[4][0]
      ]
    ]

    Enum.reduce(
      rows ++ columns ++ diagonals,
      fn element, acc -> row_has_win(element, numbers_called) && acc end,
      true
    )
  end

  def row_has_win(row, numbers_called) do
    Enum.reduce(row, fn element, acc -> Enum.member?(numbers_called, element) && acc end, true)
  end

  def board_accum(board, acc, numbers_drawn) do
    if Bingo.board_has_win(board, numbers_drawn) do
      acc ++ board
    else
      acc
    end
  end
end

input =
  File.read!(path)
  |> String.split("\n")
  |> Enum.reject(fn x -> x == "" end)

[numbers_drawn | board_rows] = input

boards =
  Enum.chunk_every(board_rows, 5)
  |> Enum.map(fn list ->
    Enum.map(
      list,
      fn s ->
        String.split(s, " ")
        |> Enum.reject(fn s -> String.length(s) == 0 end)
      end
    )
  end)

IO.inspect(
  Enum.reduce(boards, fn element, acc -> Bingo.board_accum(element, acc, numbers_drawn) end, [])
)
