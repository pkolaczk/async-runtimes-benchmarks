using System;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Threading.Tasks;

[assembly: SuppressMessage("Roslyn", "IDE0130", Justification = "This is a benchmark, we don't need to follow the usual naming conventions.")]
namespace AsyncRuntimeBenchmarks
{
    public sealed class Program
    {
        public static async Task Main(string[] args)
        {
            int numTasks = args.Length > 0 ? int.Parse(args[0], NumberStyles.Number, CultureInfo.InvariantCulture) : 100000;
            Console.WriteLine($"Starting {numTasks} tasks");

            Task[] tasks = new Task[numTasks];
            for (int i = 0; i < numTasks; i++)
            {
                tasks[i] = Task.Delay(TimeSpan.FromSeconds(10));
            }
            await Task.WhenAll(tasks);

            Console.WriteLine("All tasks complete");
        }
    }
}
