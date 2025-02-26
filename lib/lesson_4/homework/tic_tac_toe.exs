defmodule TicTacToe do
  @type cell :: :x | :o | :f
  @type row :: {cell, cell, cell}
  @type game_state :: {row, row, row}
  @type game_result :: {:win, :x} | {:win, :o} | :no_win

  @spec valid_game?(game_state) :: boolean
  def valid_game?(state) do
    tuple_size(state) == 3 &&
      Enum.all?(Tuple.to_list(state), fn row -> tuple_size(row) == 3 end) &&
      Enum.all?(Tuple.to_list(state), fn row ->
        Enum.all?(Tuple.to_list(row), fn cell -> cell in @valid_cells end)
      end)
  end

  @spec check_who_win(game_state) :: game_result
  def check_who_win(state) do
    cond do
      check_rows(board) == :x || check_columns(board) == :x || check_diagonals(board) == :x ->
        {:win, :x}

      check_rows(board) == :o || check_columns(board) == :o || check_diagonals(board) == :o ->
        {:win, :o}

      true ->
        :no_win
    end
  end

  # Проверка строк
  # defp check_rows(board) do
  #   Enum.find_value(Tuple.to_list(board), fn row ->
  #     Enum.all?(Tuple.to_list(row), do: row |> Tuple.to_list() |> List.first() )
  # end

  # # Проверка столбцов
  # defp check_columns(board) do
  #   Enum.find_value(0..2, fn col ->
  #     column = Enum.map(Tuple.to_list(board), fn row -> elem(row, col) end)
  #      Enum.all?(column, &(&1 == List.first(column)) && List.first(column) != :f, do: List.first(column)
  #   )
  # end

  # # Проверка диагоналей
  # defp check_diagonals(board) do
  #   diagonal1 = [elem(elem(board, 0), 0), elem(elem(board, 1), 1), elem(elem(board, 2), 2)]
  #   diagonal2 = [elem(elem(board, 0), 2), elem(elem(board, 1), 1), elem(elem(board, 2), 0)]

  #   cond do
  #     Enum.all?(diagonal1, &(&1 == List.first(diagonal1)) && List.first(diagonal1) != :f) ->
  #       List.first(diagonal1)
  #     Enum.all?(diagonal2, &(&1 == List.first(diagonal2)) && List.first(diagonal2) != :f) ->
  #       List.first(diagonal2)
  #     true ->
  #       nil
  #   end
  # end
end
