defmodule ListExample do
  def merge(list1, list2) do
    merge(list1, list2, [])
  end

  defp merge([], list2, acc), do: Enum.reverse(acc) ++ list2
  defp merge(list1, [], acc), do: Enum.reverse(acc) ++ list1

  defp merge(list1, list2, acc) do
    [head1 | tail1] = list1
    [head2 | tail2] = list2

    if head1 < head2 do
      acc = [head1 | acc]
      merge(tail1, list2, acc)
    else
      acc = [head2 | acc]
      merge(list1, tail2, acc)

    end
  end

end

ExUnit.start()

defmodule ListExampleTest do
  use ExUnit.Case
  import ListExample

  test "List test" do
    l1 = [1,2,3]
    l2 = [5,6,7]

    assert merge(l1,l2) == [1,2,3,5,6,7]
    assert merge([],[]) == []
  end
end
