import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

public class Threads {

    public static void main(String[] args) throws InterruptedException {
	int numTasks = 100000;
        if (args.length > 0) {
            numTasks = Integer.parseInt(args[0]);
        }

        List<Thread> threads = new ArrayList<>();

        for (int i = 0; i < numTasks; i++) {
            Thread thread = new Thread(() -> {
                try {
                    Thread.sleep(Duration.ofSeconds(10));
                } catch (InterruptedException e) {
                    // Handle exception
                }
            });
	    thread.start();
            threads.add(thread);
        }

        // Wait for all threads to complete
        for (Thread thread : threads) {
            thread.join();
        }

        System.out.println("All fibers complete");
    }
}
