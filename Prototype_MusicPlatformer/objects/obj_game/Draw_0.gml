/// @description Draw GUI
// You can write your code in this editor

// Turns out Draw Begin draws before the background. Who knew v(0-0)v

var camera = getCameraFeatures();

#region Draw Timer
if (global.toggleGUI)
{
	var timerX = camera.cam_centerX;
	var timerY = camera.cam_centerY-(camera.cam_h/3);
	drawTimer(timerX,timerY);
}

#endregion

#region Player HP, EXP, notes queued
if (instance_exists(obj_player) && global.toggleGUI)
{	
	with (obj_player)
	{
		var spriteWidth = sprite_get_width(sprite_index);
		var barOffset = spriteWidth/4;	//Amount of distance each progress bar has between each other
		if (hp < max_hp)
		{
			drawProgressBar(x,y,spriteWidth,max_hp,hp,c_red);
		}
		
		if (xp < max_xp)
		{
			drawProgressBar(x,y+barOffset,spriteWidth,max_xp,xp,c_aqua);
		}
		
		if (inputQueue_size > 0)
		{
			var spriteWidth_input = sprite_get_width(spr_right);
			var comboX = x-((spriteWidth/2)*inputQueue_size);
			var comboY = y-(spriteWidth/2)-spriteWidth_input;
			drawInputCombo(comboX,comboY,inputQueue,false);
		}
		
		/*
		draw_set_color(c_black);
		var radius = 100;
		draw_circle(x,y,radius,true);
		draw_arrow(x,y,x+(radius*debug_moveX),y+(radius*debug_moveY),10);
		draw_set_color(c_blue);
		draw_arrow(x,y,x+(radius*moveVector_x),y+(radius*moveVector_y),10);
		*/
	}
	
	/*
	if (instance_exists(obj_enemy))
	{
		with (obj_enemy)
		{
			draw_set_color(c_black);
			var radius = 50;
			draw_circle(x,y,radius,true);
			draw_arrow(x,y,x+(radius*debug_moveX),y+(radius*debug_moveY),10);
		}
	}
	*/
}

#endregion

#region Pause Screen
if (global.gamePaused && global.displayPaused)
{	
	draw_set_font(fnt_titleText);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(camera.cam_centerX,camera.cam_centerY,"Game Paused");
	
	draw_set_font(fnt_descText);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	var spriteWidth_input = sprite_get_width(spr_right);
	var posX = camera.cam_centerX;
	var posY = camera.cam_centerY-100;
	var paddingX = 150;
	var paddingY = 20;
	for (var i = 0; i < array_length(obj_player.availablePhrases); i++)
	{
		var phrase = obj_player.availablePhrases[i];
		var textPos = posX+(paddingX*(i-1));
		draw_text(textPos,posY,phrase.name);
		drawInputCombo(textPos-(spriteWidth_input*(array_length(phrase.combination)/2)),posY+paddingY,phrase.combination,false);
	}
		
}

#endregion