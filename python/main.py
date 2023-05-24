import asyncio
import sys

async def perform_task():
    await asyncio.sleep(10)

async def main(num_tasks: int):
    gen = (asyncio.create_task(perform_task()) for i in range(num_tasks))
    await asyncio.gather(*gen)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        num_tasks = int(sys.argv[1])
    else:
        num_tasks = 100000

    asyncio.run(main(num_tasks))
    print("All tasks completed")

