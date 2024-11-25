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

function spawnPhraseNote(obj,moveState,angle,radius,stats)
{
	var pos_x = obj.x + (radius*dcos(angle));
	var pos_y = obj.y + (radius*dsin(angle));
	var objNote = instance_create_layer(pos_x,pos_y,"Instances",obj_phraseNote);
	objNote.moveState = moveState;
	objNote.objTether = obj;
	objNote.radius = radius;
	objNote.angle = angle;
	
	objNote.stats = stats;
	objNote.hp = stats.max_hp;
};

function spawnProjPattern(obj,state,pattInfo,stats,isDirDependant=false)
{
	#region Simplify patternInfo paths
	var maxAngle = pattInfo.maxAngle;
	var minAngle = pattInfo.minAngle;
	var numNotes = pattInfo.numNotes;
	var radius = pattInfo.radius;
	
	#endregion
	
	var angle = 0;
	if (maxAngle-minAngle != 360)
	{
		angle = (maxAngle-minAngle)/(numNotes-1);
	}
	else
	{
		angle = (maxAngle-minAngle)/numNotes;
	}
	if (minAngle < 0) {minAngle = 360+minAngle;}	//Arithmetic doesn't work if minAngle < 0
	
	var objDir = 0;
	if (isDirDependant) {objDir = 360-(obj.moveDir*-45);}
	for (var i = 0; i < numNotes; i++)
	{
		spawnPhraseNote(obj,state,objDir+minAngle+(i*angle),radius,stats);
	}
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