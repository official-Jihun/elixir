defmodule FactoTask do

  def factorial(0), do: 1

  def factorial(x) do
    # Process.sleep(1000)
    x * factorial(x-1)
  end

  def test do
    send self(), {:hello, "world"}
    task1 = Task.async(FactoTask, :factorial, [50_00])
    task2 = Task.async(FactoTask, :factorial, [50_000])
    task3= Task.async(FactoTask, :factorial, [50_000])
    t2 = Task.await(task2)
    IO.puts "Fin2"
    t1 = Task.await(task1)
    IO.puts "Fin1"
    receive do
      _ -> IO.puts "hello"
    end

  end

end


# FactoTask.factorial(50_000)

# task = Task.async(FactoTask, :factorial, [50_000])
# Task.await(task)
# Task.yield(task,10)
