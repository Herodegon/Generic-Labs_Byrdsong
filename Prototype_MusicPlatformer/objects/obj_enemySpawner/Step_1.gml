/// @description Spawn enemies
// You can write your code in this editor

#region Run Timer Logic
if (!isPaused)
{
	#region Enemy Spawning
	currTimer -= global.deltaTime;
	if ((currTimer <= 0 && canSpawn && global.numEnemies < enemyLimit) || global.forceSpawn)
	{
		var currBudget = maxBudget;
		while (currBudget > 0)
		{
			for(i = array_length(availableEnemies)-1; i >= 0; i--)
			{
				if (availableEnemies[i].cost <= currBudget)
				{
					var chosenEnemy = availableEnemies[i];
					var numEnemies = round(random(currBudget/chosenEnemy.cost));
					spawnEnemies(numEnemies,chosenEnemy.object,chosenEnemy.sprite);
					currBudget -= chosenEnemy.cost*numEnemies;
					global.numEnemies += numEnemies;
				}				
			}
		}
		currTimer = waveTimer;
	}
	
	#endregion
	
	#region Increase Budget
	currBudgetTimer -= global.deltaTime;
	if (currBudgetTimer <= 0)
	{
		maxBudget = round(maxBudget*budgetIncreaseMult);
		currBudgetTimer = maxBudgetTimer;
	}
	
	#endregion
	
	#region Increase Enemy Pool
	currEnemyTimer -= global.deltaTime;
	if (currEnemyTimer <= 0)
	{
		array_push(availableEnemies,obj_game.poolEnemies[0])
		array_delete(obj_game.poolEnemies,0,1);
		currEnemyTimer = addEnemyTimer;
	}
	
	#endregion
}

#endregion
	