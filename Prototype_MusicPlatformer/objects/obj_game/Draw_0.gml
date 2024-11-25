/// @description Draw GUI
// You can write your code in this editor

// Turns out Draw Begin draws before the background. Who knew v(0-0)v

var camera = getCameraFeatures();

#region Player HP and EXP
if (instance_exists(obj_player) && global.toggleGUI)
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