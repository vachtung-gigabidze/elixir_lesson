defmodule ControlFlow do
  def handle(animal, action) do
    case animal do
      {:dog, name} ->
        case action do
          :feed -> IO.puts("feed the dog #{name}")
          :pet -> IO.puts("pet the dog #{name}")
        end
      {:cat, name} ->
        case action do
          :feed -> IO.puts("feed the cat #{name}")
          :pet -> IO.puts("pet the cat #{name}")
        end
      {:rat, name} ->
        case action do
          :feed -> IO.puts("feed the rat #{name}")
          :pet -> IO.puts("pet the rat #{name}")
        end
    end
  end

  def handle2(animal, action) do
    case {animal, action} do
       {{:dog, name}, :feed} -> IO.puts("feed the dog #{name}")
       {{:dog, name}, :pet} -> IO.puts("pet the dog #{name}")
       {{:cat, name}, :feed} -> IO.puts("feed the cat #{name}")
       {{:cat, name}, :pet} -> IO.puts("pet the cat #{name}")
       {{:rat, name}, :feed} -> IO.puts("feed the rat #{name}")
       {{:rat, name}, :pet} -> IO.puts("pet the rat #{name}")
    end
  end



  def handle3({:dog, name}, :feed) do
    IO.puts("feed the dog #{name}")
  end
  def handle3({:dog, name}, :pet) do
    IO.puts("pet the dog #{name}")
  end
  def handle3({:cat, name}, :feed) do
    IO.puts("feed the cat #{name}")
  end
  def handle3({:cat, name}, :pet) do
    IO.puts("pet the cat #{name}")
  end
  def handle3({:rat, name}, action) do
    IO.puts("do action '#{action}' with rat '#{name}'")
  end
  #catch all
  def handle3({animal_type, name}, action) do
    IO.puts("do action '#{inspect(action)}' with animal '#{inspect(animal_type)}' #{name}")
  end

  def handle4(animal) do
    case animal do
      {:dog, name, age} when age <= 2 -> IO.puts("dog #{name} is a yong dog")
      {:dog, name, _} -> IO.puts("dog #{name} is an adult dog")
      {:cat, name, age} when age > 10 -> IO.puts("cat #{name} is an adult")
      {:cat, name, _}  -> IO.puts("cat #{name} is not so old")
    end
  end

  def handle5({:dog, name, age}) when age <= 2 do
    IO.puts("#{name} is a young dog")
  end
  def handle5({:dog, name, _}) do
    IO.puts("#{name} is an adult dog")
  end
  def handle5({:cat, name, age}) when age > 10 do
    IO.puts("#{name} is an old cat")
  end
  def handle5({:cat, name, _}) do
    IO.puts("#{name} is not so old")
  end

  def handle6({:library, rating, books}) when rating > 4 and length(books) > 2 do
    IO.puts("good library")
  end

  def handle6({:library, rating, books}) when rating > 4 or length(books) > 2 do
    IO.puts("not too bad")
  end

  def handle6({:library, _rating, _books}) do
    IO.puts("not recommended")
  end
end
