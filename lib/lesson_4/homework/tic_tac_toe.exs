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
      check_rows(state) == :x || check_columns(state) == :x || check_diagonals(state) == :x ->
        {:win, :x}

      check_rows(state) == :o || check_columns(state) == :o || check_diagonals(state) == :o ->
        {:win, :o}

      true ->
        :no_win
    end
  end

  # Проверка строк
  defp check_rows(state) do
    List.first(
      Enum.find(matrix, fn row ->
        first_element = List.first(row)
        Enum.all?(row, fn element -> element == first_element end)
      end)
    )
  end

  # Проверка столбцов
  defp check_columns(state) do
    num_columns = length(List.first(state))

    # Перебираем индексы столбцов
    Enum.map(0..(num_columns - 1), fn col_index ->
      # Собираем элементы столбца
      Enum.map(state, fn row -> Enum.at(row, col_index) end)
    end)
  end

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
