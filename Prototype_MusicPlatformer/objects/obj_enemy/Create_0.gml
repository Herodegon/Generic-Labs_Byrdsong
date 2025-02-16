/// @description Initialize enemy
// You can write your code in this editor

#region Sprite Initialization
depth = DEPTH_ENEMY;

#endregion

#region Enemy Variables
hp = 1;			//Number of hits before enemy is destroyed
damage = 1;		//Damage enemy deals 
objDrop = obj_xp;

moveSpeed = 1;
moveVector_x = 0;
moveVector_y = 0;

currState = ENEMY_STATES.CHASE;
chaseTarget = obj_player;

#region Timers
invulnerablePeriod = 0.05*MILLISECONDS
invulnerableTimer = 0;
hitTimer = 0;

/* TODO: Reduce pathfinding equations down to x per second
calcMove_x = 0;
calcMove_y = 0;
pathfindingTimer = 0.05*MILLISECONDS;
currPathTimer = pathfindingTimer;
*/

#endregion

canMove = true;
isBoss = false;

isPaused = false;

isInvincible = false;
tookDamage = false;

#endregion

#region Handling Sound Machine
global.numEnemyMusicPoints += musicPointValue;
#endregion