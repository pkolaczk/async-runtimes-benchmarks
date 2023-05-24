import asyncio
import sys


async def main(num_tasks):
    tasks = tuple(asyncio.create_task(asyncio.sleep(10)) for _ in range(num_tasks))
    for task in tasks:
        await task


if __name__ == "__main__":
    if len(sys.argv) > 1:
        num_tasks = int(sys.argv[1])
    else:
        num_tasks = 100000

    asyncio.run(main(num_tasks))
    print("All tasks completed")
