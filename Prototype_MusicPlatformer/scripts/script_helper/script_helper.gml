// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initGameController()
{
	instance_create_layer(0,0,"Instances",obj_game);	
};

function spawnPlayer()
{
	var obj_x = room_width/2;
	var obj_y = room_height/2;
	instance_create_layer(obj_x,obj_y,"Instances",obj_player);
};