/// @description Insert description here
// You can write your code in this editor

if (isGuiObject)
{
	if (depth = DEPTH_PROJECTILE) {depth = DEPTH_GUI_OBJECTS;}
	
	var alpha = draw_get_alpha();
	draw_set_alpha(image_alpha);
	draw_sprite(sprite_index,0,x,y);
	draw_set_alpha(alpha);
}