/// @description Draw GUI
// You can write your code in this editor

// Turns out Draw Begin draws before the background. Who knew v(0-0)v

var camera = getCameraFeatures();

if (instance_exists(obj_player) && global.toggleGUI)
{
	draw_set_font(fnt_gameText);
	draw_set_color(c_purple);
	draw_text(camera.cam_x,camera.cam_y,string("{0}: DOWN,DOWNRIGHT,RIGHT",obj_player.availablePhrases[0].name));
	draw_text(camera.cam_x,camera.cam_y+16,string("{0}: LEFT,RIGHT,DOWN",obj_player.availablePhrases[1].name));
	draw_text(camera.cam_x,camera.cam_y+camera.cam_h-16,string("HP: {0}",obj_player.hp));
}

#region Player HP and EXP
if (instance_exists(obj_player))
{
	with (obj_player)
	{
		var spriteWidth = sprite_get_width(sprite_index);
		var barOffset = spriteWidth/4;	//Amount of distance each progress bar has between each other
		if (hp < max_hp)
		{
			DrawProgressBar(x,y,spriteWidth,max_hp,hp,c_red);
		}
		
		if (xp < max_xp)
		{
			DrawProgressBar(x,y+barOffset,spriteWidth,max_xp,xp,c_aqua);
		}
	}
}

#endregion