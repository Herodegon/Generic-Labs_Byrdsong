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

function initEnemySpawner()
{
	instance_create_layer(0,0,"Instances",obj_enemySpawner);
};

function initPhraseStore()
{
	instance_create_layer(0,0,"Instances",obj_phraseStore);
};

function moveMap(objMove_x,objMove_y)
{
	//TODO: Get background to scroll with player movement
	var background_id = layer_background_get_id("Background");
	var sprite_id = layer_background_get_sprite(background_id);
	var background_x = layer_get_x(background_id);
	var background_y = layer_get_y(background_id);
	//layer_sprite_x(sprite_id,background_x-objMove_x);
	//layer_sprite_y(sprite_id,background_y-objMove_y);
	//layer_vspeed(background_id,-objMove_x);
	//layer_hspeed(background_id,-objMove_y);
	/*
	if (instance_exists(obj_enemy))
	{
		with (obj_enemy)
		{
			x -= objMove_x;
			y -= objMove_y;
		}
	}
	*/
}