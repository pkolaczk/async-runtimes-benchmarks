defmodule Main do
  def start() do
    num_tasks = case System.argv |> List.first() |> Integer.parse() do
      {num, _} -> num
      _ -> 10000
    end

    tasks =
      for _ <- 1..num_tasks do
        spawn_monitor(fn ->
          :timer.sleep(10000)
        end)
      end

    for {_pid, ref} <- tasks do
      receive do
        {:DOWN, ^ref, _, _, _} -> :ok
      end
    end

    IO.puts("All processes completed")
  end
end

Main.start()

