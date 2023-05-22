const util = require('util');

const delay = util.promisify(setTimeout);

async function runTasks(numTasks) {
  const tasks = [];

  for (let i = 0; i < numTasks; i++) {
    tasks.push(delay(10000));
  }

  await Promise.all(tasks);

  console.log('All tasks completed');
}

const numTasks = parseInt(process.argv[2]) || 10000;

runTasks(numTasks).catch((error) => {
  console.error('Error:', error);
});
