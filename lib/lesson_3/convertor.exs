defmodule Convertor do
  def database() do
    [
      {"C1", "C2", 1.5, 1.6},
      {"C1", "C3", 2.5, 2.6},
      {"C1", "C4", 1.05, 1.07},
    ]
  end

  def init(rows) do
    init(rows, %{})
  end

  def init([], acc), do: acc

  def init([row | rows ], acc) do
    {c1, c2, k1, k2} = row

    new_acc =
      acc
      |> Map.put({c1, c2}, k1)
      |> Map.put({c2, c1}, k2)

    init(rows, new_acc)
  end

  def convertor(cur_info, from_cur, to_cur, amount ) do

    case Map.fetch(cur_info, {from_cur, to_cur}) do
      {:ok, coef} -> {:ok,  amount * coef}
      :error -> :not_found
    end
  end
end


ExUnit.start()

defmodule ConvertorTest do

  use ExUnit.Case
  import Convertor

  test "init test" do
    assert init(database()) == %{
      {"C1", "C2"} => 1.5,
      {"C1", "C3"} => 2.5,
      {"C1", "C4"} => 1.05,
      {"C2", "C1"} => 1.6,
      {"C3", "C1"} => 2.6,
      {"C4", "C1"} => 1.07
    }
  end

  test "convertor" do
    assert convertor(init(database()), "C1", "C2", 1) == {:ok, 1.5}
    assert convertor(init(database()), "C4", "C2", 1) == :not_found
  end
end
