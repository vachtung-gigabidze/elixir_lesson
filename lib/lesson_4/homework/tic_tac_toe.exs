defmodule TicTacToe do
  @type cell :: :x | :o | :f
  @type row :: {cell, cell, cell}
  @type game_state :: {row, row, row}
  @type game_result :: {:win, :x} | {:win, :o} | :no_win

  @spec valid_game?(game_state) :: boolean
  def valid_game?(board) do
    is_valid_structure?(board) && is_valid_cells?(board)
  end

  @valid_cells [:x, :o, :f]

  defp is_valid_structure?(board) do
    tuple_size(board) == 3 &&
      Enum.all?(Tuple.to_list(board), fn row -> tuple_size(row) == 3 end)
  end

  defp is_valid_cells?(board) do
    Enum.all?(Tuple.to_list(board), fn row ->
      Enum.all?(Tuple.to_list(row), fn cell -> cell in @valid_cells end)
    end)
  end

  @spec check_who_win(game_state) :: game_result
  def check_who_win(game_state) do
    case game_state do
      {{:x, :x, :x}, _, _} -> {:win, :x}
      {_, {:x, :x, :x}, _} -> {:win, :x}
      {_, _, {:x, :x, :x}} -> {:win, :x}
      {{:x, _, _}, {:x, _, _}, {:x, _, _}} -> {:win, :x}
      {{_, :x, _}, {_, :x, _}, {_, :x, _}} -> {:win, :x}
      {{_, _, :x}, {_, _, :x}, {_, _, :x}} -> {:win, :x}
      {{:x, _, _}, {_, :x, _}, {_, _, :x}} -> {:win, :x}
      {{_, _, :x}, {_, :x, _}, {:x, _, _}} -> {:win, :x}
      {{:o, :o, :o}, _, _} -> {:win, :o}
      {_, {:o, :o, :o}, _} -> {:win, :o}
      {_, _, {:o, :o, :o}} -> {:win, :o}
      {{:o, _, _}, {:o, _, _}, {:o, _, _}} -> {:win, :o}
      {{_, :o, _}, {_, :o, _}, {_, :o, _}} -> {:win, :o}
      {{_, _, :o}, {_, _, :o}, {_, _, :o}} -> {:win, :o}
      {{:o, _, _}, {_, :o, _}, {_, _, :o}} -> {:win, :o}
      {{_, _, :o}, {_, :o, _}, {:o, _, _}} -> {:win, :o}
      _ -> :no_win
    end
  end
end
