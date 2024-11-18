/// @description Initialize enemy
// You can write your code in this editor

#region Sprite Initialization
depth = 2;

#endregion

#region Enemy Variables
enum States {
	CHASE
}

hp = 1;			//Number of hits before enemy is destroyed
damage = 1;		//Damage enemy deals

moveSpeed = 1;
moveSpeed_diag = 0.5;
moveVector_x = 0;
moveVector_y = 0;

currState = States.CHASE;

#endregion