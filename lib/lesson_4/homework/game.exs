defmodule Game do
  def join_game({:user, name, age, role}) do
    case {age, role} do
      {_, :admin} -> :ok
      {_, :moderator} -> :ok
      {age, _} when age >= 18 -> :ok
      _ -> :error
    end
  end

  def move_allowed?(current_color, figure) do
    case figure do
      {:pawn, color} when current_color == color -> true
      {:rock, color} when current_color == color -> true
      _ -> false
    end
  end

  def single_win?(a_win, b_win) do
    a_win != b_win
  end

  def double_win?(a_win, b_win, c_win) do
    case {a_win, b_win, c_win} do
      {true, true, false} -> :ab
      {true, false, true} -> :ac
      {false, true, true} -> :bc
      _ -> false
    end
  end
end
