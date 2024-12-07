/// @description Spawn enemies
// You can write your code in this editor

if (!isPaused)
{
	currTimer -= global.deltaTime;
	currBudgetTimer -= global.deltaTime;
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
}

#region Check timer to increase max budget
if (!isPaused)
{
	if (currBudgetTimer <= 0)
	{
		maxBudget = round(maxBudget*budgetIncreaseMult);
		currBudgetTimer = maxBudgetTimer;
	}
	
	if (currEnemyTimer <= 0)
	{
		array_push(availableEnemies,obj_game.poolEnemies[0])
		array_delete(obj_game.poolEnemies,0,1);
		currEnemyTimer = addEnemyTimer;
	}
}

#endregion
	