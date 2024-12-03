/// @description Spawn enemies
// You can write your code in this editor

if (!isPaused)
{
	currTimer -= global.deltaTime;
	currBudgetTimer -= global.deltaTime;
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
}

#region Check timer to increase max budget
if (!isPaused)
{
	if (currBudgetTimer <= 0)
	{
		maxBudget = round(maxBudget*budgetIncreaseMult);
		currBudgetTimer = maxBudgetTimer;
	}
}

#endregion
	