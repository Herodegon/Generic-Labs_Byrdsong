/// @description Create GUI if player levels up
// You can write your code in this editor

var camera = getCameraFeatures();

var spacing_width = camera.cam_w/5;
var spacing_height = camera.cam_h/8;

if (instance_exists(obj_player))
{
	for (var i = 1; i <= 3; i++)
	{
		var rect_x1 = camera.cam_x + (spacing_width*i) + (sign(i-2)*(spacing_width/2));
		var rect_y1 = camera.cam_y + spacing_height;
		var rect_x2 = rect_x1 + (spacing_width);
		var rect_y2 = rect_y1 + (spacing_height*6);
		obj_game.DrawPhraseSelect(rect_x1,rect_y1,rect_x2,rect_y2,noone);
	}
}