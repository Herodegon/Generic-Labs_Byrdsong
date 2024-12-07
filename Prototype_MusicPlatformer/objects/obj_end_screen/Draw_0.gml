/// @description Insert description here
// You can write your code in this editor

var camera = getCameraFeatures()
var posX = camera.cam_centerX;
var posY = camera.cam_centerY;

draw_set_font(fnt_titleText);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(posX,posY,"Game Over");
	
draw_set_font(fnt_descText);
draw_text(posX,posY+(camera.cam_h/5),"ESC to return to main menu");

draw_text(posX,posY-(camera.cam_h/5),string("Enemies Calmed: {0}", global.enemiesKilled));
drawTimer(posX,posY-((camera.cam_h*2)/5));

	
	
