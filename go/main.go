package main

import (
    "fmt"
    "os"
    "strconv"
    "sync"
    "time"
)

func main() {
    numRoutines := 100000
    if len(os.Args) > 1 {
        n, err := strconv.Atoi(os.Args[1])
        if err == nil {
            numRoutines = n
        }
    }

    var wg sync.WaitGroup
    for i := 0; i < numRoutines; i++ {
	wg.Add(1)
	go func() {
	    defer wg.Done()
	    time.Sleep(10 * time.Second)
	}()
    }
    wg.Wait()
    fmt.Println("All goroutines finished.")
}


