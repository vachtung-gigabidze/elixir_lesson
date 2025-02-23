defmodule StringExample do

  @doc """
  |  q   |
  |  gg  |
  |  ggg |
  | gggg |
  |gggggg|
  """
  def align_words(words) do
    max_length = find_max_len(words)
    # dbg(max_length)
    Enum.map(words, fn word -> align_word(word, max_length) end )
  end

  def find_max_len(word), do: find_max_len(word, 0)
  def find_max_len([], cur_max), do: cur_max

  def find_max_len([word | words], cur_max) do
    find_max_len(words, max(String.length(word), cur_max))
  end

  def align_word(word, len) do
    word_len = String.length(word)
    spaces = len - word_len
    spaces_left = cond do
      spaces > 1 ->
          multi_str(" ",  div(spaces, 2))
      spaces == 1 -> " "
      true -> ""
      end
    spaces_right = cond do
      spaces > 1 ->
          multi_str(" ",  spaces - div(spaces, 2))
      true -> ""
      end

    # dbg(spaces)
    spaces_left <> word <> spaces_right
  end
  def multi_str(str, 1), do: str
  # @spec multi_str(str :: String, n :: Integer) :: String
  def multi_str(str, n) do
    str <> multi_str(str, n-1)
  end
end

ExUnit.start()

defmodule StringExampleTest do
  use ExUnit.Case
  import StringExample

  test "find max len" do
    assert find_max_len(["1", "22", "333"]) == 3
  end

  test "multi str" do
    assert multi_str("3", 3) == "333"

    assert multi_str(" ", 3) == "   "
  end

  test "align word" do
    assert align_word("333", 4) == " 333"
    assert align_word("22", 4) == " 22 "
    assert align_word("1", 4) == " 1  "
  end

  test "align words" do
    assert align_words(["1", "22", "333"]) == [" 1 ", " 22", "333"]
  end


end
