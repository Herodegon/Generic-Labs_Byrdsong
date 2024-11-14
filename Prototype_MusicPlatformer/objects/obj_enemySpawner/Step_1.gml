/// @description Spawn enemies
// You can write your code in this editor

var currTime = global.gameTimer%waveTimer;
if (currTime < prevTime)
{
	var currBudget = maxBudget;
	while (currBudget > 0)
	{
		for(i = array_length(poolEnemies)-1; i >= 0; i--)
		{
			//TODO: Create more robust spawner
			if (poolEnemies[i].cost <= currBudget)
			{
				var numEnemies = round(random(currBudget/poolEnemies[i].cost));
				spawnEnemies(numEnemies,poolEnemies[i].object);
				currBudget -= poolEnemies[i].cost*numEnemies;
			}				
		}
	}
}

prevTime = currTime;