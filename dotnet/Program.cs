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
            tasks.add(Task.Delay(TimeSpan.FromSeconds(10)));
        }

        await Task.WhenAll(tasks);

        Console.WriteLine("All tasks complete");
    }
}
