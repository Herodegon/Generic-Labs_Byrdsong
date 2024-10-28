/// @description Handle note movement
// You can write your code in this editor

#region Movement
var objSpeed = moveSpeed;
if (moveVector_x != 0 && moveVector_y != 0) 
{
	objSpeed = moveSpeed_diag;
}
x += objSpeed*moveVector_x;
y += objSpeed*moveVector_y;

#endregion