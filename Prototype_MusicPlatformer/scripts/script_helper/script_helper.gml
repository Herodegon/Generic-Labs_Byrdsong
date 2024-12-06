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

function spawnXP(pos_x,pos_y)
{
	instance_create_layer(pos_x,pos_y,"Instances",obj_xp);
};

function initEnemySpawner()
{
	instance_create_layer(0,0,"Instances",obj_enemySpawner);
};

function initPhraseStore()
{
	instance_create_layer(0,0,"Instances",obj_phraseStore);
};

function initSoundMachine()
{
	instance_create_layer(0,0,"Instances",obj_soundMachine);
};

function moveMap(objMove_x,objMove_y)
{
	var layer_background = layer_get_id("Background");
	layer_hspeed(layer_background,-objMove_x);
	layer_vspeed(layer_background,-objMove_y);
	
	if (instance_exists(obj_note))
	{
		with (obj_note)
		{
			if (!isPlayerLocked)
			{
				x -= objMove_x;
				y -= objMove_y;
			}
		}
	}
	
	if (instance_exists(obj_enemy))
	{
		with (obj_enemy)
		{
			x -= objMove_x;
			y -= objMove_y;
		}
	}

	if (instance_exists(obj_xp))
	{
		with (obj_xp)
		{
			x -= objMove_x;
			y -= objMove_y;
		}
	}
};