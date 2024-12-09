/// @description Insert description here
// You can write your code in this editor

var camera = getCameraFeatures();
var posX = camera.cam_centerX;
var posY = camera.cam_centerY;

var alpha = draw_get_alpha();
draw_set_alpha(screenAlpha);
draw_text(posX,posY,"        ?");
draw_set_alpha(alpha);

draw_set_font(fnt_titleText);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(posX,posY,"YOU WIN");