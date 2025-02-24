defmodule FizzBuzz do
  @moduledoc """
  FuzzBuzz is a simple Fuzz Buzz
  """
  def m() do
    fizzBuzz_100()
    |> Enum.join(" ")
    |> IO.puts()
  end

  @doc """
  FuzzBuzz for 1..100
  """
  def fizzBuzz_100() do
    Enum.map(1..100, &fizzbuzz/1)
  end

  @spec fizzbuzz(integer()) :: String.t()
  def fizzbuzz(number) do
    div_by_3 = rem(number, 3) == 0
    div_by_5 = rem(number, 5) == 0

    cond do
      div_by_3 and div_by_5 -> "FizzBuzz"
      div_by_3 -> "Fizz"
      div_by_5 -> "Buzz"
      true -> to_string(number)
    end
  end
end

ExUnit.start()

defmodule FizzBuzzTest do
  use ExUnit.Case
  import FizzBuzz

  test "fizzbuzz 1-10" do
    assert fizzbuzz(1) == "1"
    assert fizzbuzz(2) == "2"
    assert fizzbuzz(3) == "Fizz"
    assert fizzbuzz(4) == "4"
    assert fizzbuzz(5) == "Buzz"
    assert fizzbuzz(6) == "Fizz"
    assert fizzbuzz(7) == "7"
    assert fizzbuzz(8) == "8"
    assert fizzbuzz(9) == "Fizz"
    assert fizzbuzz(10) == "Buzz"
  end

  test "fizzbuzz for some number > 10" do
    assert fizzbuzz(30) == "FizzBuzz"
    assert fizzbuzz(34) == "34"
    assert fizzbuzz(60) == "FizzBuzz"
    assert fizzbuzz(44) == "44"
    assert fizzbuzz(55) == "Buzz"
    assert fizzbuzz(66) == "Fizz"
    assert fizzbuzz(77) == "77"
    assert fizzbuzz(88) == "88"
    assert fizzbuzz(99) == "Fizz"
    assert fizzbuzz(100) == "Buzz"
  end

  test "fizzbuzz_100" do
    result = fizzBuzz_100()
    assert Enum.take(result, 5) == ["1", "2", "Fizz", "4", "Buzz"]
    assert Enum.at(result, 10) == "11"
  end
end
