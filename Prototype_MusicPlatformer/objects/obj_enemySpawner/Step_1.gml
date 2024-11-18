/// @description Spawn enemies
// You can write your code in this editor

currTimer -= global.deltaTime;
if ((currTimer <= 0 && canSpawn) || global.forceSpawn)
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
				spawnEnemies(numEnemies,poolEnemies[i].object,poolEnemies[i].sprite);
				currBudget -= poolEnemies[i].cost*numEnemies;
				global.numEnemies += numEnemies;
			}				
		}
	}
	currTimer = waveTimer;
}

show_debug_message("Num Enemies: {0}",global.numEnemies);