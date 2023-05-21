# async-runtimes-benchmarks

This repository contains a few programs written in various programing languages.
Each program spawns N concurrent tasks. The number of tasks is controlled by the 
command line argiment. Each tasks waits 10 seconds and finishes. The programs finish when
all tasks exit.

The purpose of those programs is to measure the memory footprint of concurrent tasks in
different language runtimes. 
