function task_function()
    sleep(10)
end

function main()
    # Check if the number of tasks is provided as a command line argument
    if length(ARGS) < 1
        println("Usage: julia concurrent_tasks.jl <num_tasks>")
        return
    end

    # Get the number of tasks from the command line argument
    num_tasks = parse(Int, ARGS[1])

    # Spawn concurrent tasks
    tasks = Vector{Task}(undef, num_tasks)
    for i in 1:num_tasks
        tasks[i] = @async task_function()
    end

    # Wait for all tasks to finish
    for task in tasks
        wait(task)
    end

    println("All tasks have finished.")
end

stats = @timed main()
