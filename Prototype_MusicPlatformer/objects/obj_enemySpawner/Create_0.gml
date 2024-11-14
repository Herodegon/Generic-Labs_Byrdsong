/// @description Initialize spawner
// You can write your code in this editor

function spawnEnemies(num,obj,spr)
{
	var camera = getCameraFeatures();
	for (var i = 0; i < num; i++)
	{
		var spacing_w = sprite_get_width(spr)*2;
		var spacing_h = sprite_get_height(spr)*2;
		var obj_x = 0;
		var obj_y = 0;
		var randWall = round(random(3));
		switch(randWall)
		{
			case 0:		//Left Wall
				obj_x = camera.cam_x;
				obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))-spacing_w;
				break;
			case 1:		//Right Wall
				obj_x = camera.cam_x+camera.cam_w;
				obj_y = round(random_range(camera.cam_y,camera.cam_y+camera.cam_h))+spacing_w;
				break;
			case 2:		//Top Wall
				obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))-spacing_h;
				obj_y = camera.cam_y;
				break;
			case 3:		//Bottom Wall
				obj_x = round(random_range(camera.cam_x,camera.cam_x+camera.cam_w))+spacing_h;
				obj_y = camera.cam_y+camera.cam_h;
				break;
		}
		instance_create_layer(obj_x,obj_y,"Instances",obj);	
	}
}

poolEnemies = [
	{
		name: "Raccoon",
		object: obj_enemy,
		sprite: spr_enemy_down,
		cost: 1
	}
];

maxBudget = 15;
waveTimer = 3*MILLISECONDS;		//Time in milliseconds
prevTime = 0;