using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        int numTasks = args.Length > 0 ? int.Parse(args[0]) : 100000;
	Console.WriteLine($"Starting {numTasks} tasks");

        List<Task> tasks = new List<Task>();

        for (int i = 0; i < numTasks; i++)
        {
            Task task = Task.Run(async () =>
            {
                await Task.Delay(TimeSpan.FromSeconds(10));
            });

            tasks.Add(task);
        }

        await Task.WhenAll(tasks);

        Console.WriteLine("All tasks complete");
    }
}
