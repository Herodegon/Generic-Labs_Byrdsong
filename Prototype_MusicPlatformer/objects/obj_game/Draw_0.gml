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
		if (hp < max_hp)
		{
			var rect_x1 = x-(sprite_get_width(sprite_index)/2);
			var rect_y1 = y+(sprite_get_width(sprite_index));
			var rect_x2 = x+(sprite_get_width(sprite_index)/2);
			var rect_y2 = rect_y1+(sprite_get_width(sprite_index)/4);
			draw_set_color(c_black);
			draw_rectangle(rect_x1,rect_y1,rect_x2,rect_y2,false);
			
			if (hp > 0)
			{
				var health_width = ((rect_x2-rect_x1)/max_hp)*hp;
				draw_set_color(c_red);
				draw_rectangle(rect_x1,rect_y1,rect_x1+health_width,rect_y2,false);
			}
		}
	}
}

#endregion