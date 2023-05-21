defmodule Main do
  def start() do
    num_tasks = case System.argv |> List.first() |> Integer.parse() do
      {num, _} -> num
      _ -> 10000
    end

    tasks =
      for _ <- 1..num_tasks do
        Task.async(fn ->
          :timer.sleep(10000)
        end)
      end

    Task.await_many(tasks, :infinity)
    IO.puts("All tasks completed")
  end
end

Main.start()

