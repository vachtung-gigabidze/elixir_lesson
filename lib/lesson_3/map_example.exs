defmodule MapExample do
  def test_string() do
  """
  Elixir и Haskell — это два функциональных языка программирования,
  и они имеют некоторые сходства, хотя и отличаются по многим аспектам.
  """
  end

  def count_words(str) do
    str
    |> String.split()
    |> count_words(%{})
  end

  def count_words([], acc), do: acc

  def count_words([ word | words ], acc) do
    new_acc = case Map.fetch(acc, word) do
      {:ok, counter} -> %{acc | word => counter + 1}
      :error -> Map.put(acc, word, 1)
    end
    count_words(words, new_acc)
  end
end

ExUnit.start()

defmodule MapExampleTest do

  use ExUnit.Case
  import MapExample

  test "count words test" do

    assert count_words("") == %{}
    assert count_words("test") == %{"test" => 1}
    assert count_words("test test") == %{"test" => 2}
  end

end
