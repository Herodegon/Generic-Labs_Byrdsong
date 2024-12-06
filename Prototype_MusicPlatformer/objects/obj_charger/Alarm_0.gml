/// @description Insert description here
// You can write your code in this editor

moveVector_x = instance_nearest(x, y, obj_player).x;
moveVector_y = instance_nearest(x, y, obj_player).y;
direction = point_direction(x, y, moveVector_x, moveVector_y);