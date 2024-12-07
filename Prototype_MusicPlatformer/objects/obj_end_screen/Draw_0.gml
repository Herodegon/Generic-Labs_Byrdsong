/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_titleText);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x,y,"Game Over");
	
draw_set_font(fnt_descText);
draw_text(x,y+100,"ESC to return to main menu");

draw_text(x,y-100,string("Enemies Calmed: {0}", global.enemiesKilled));
drawTimer(x,y-50);

	
	
