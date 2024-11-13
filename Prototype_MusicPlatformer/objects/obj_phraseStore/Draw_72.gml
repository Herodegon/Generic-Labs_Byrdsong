/// @description Create GUI if player levels up
// You can write your code in this editor

var objCamera = view_camera[0];
var camera_x = camera_get_view_x(objCamera);
var camera_y = camera_get_view_y(objCamera);
var camera_width = camera_get_view_width(objCamera);
var camera_height = camera_get_view_height(objCamera);

var spacing_width = camera_width/5;
var spacing_height = camera_height/8;

if (instance_exists(obj_player))
{
	for (i = 1; i <= 3; i++)
	{
		var rect_x1 = camera_x + (spacing_width*i) + (sign(i-2)*(spacing_width/2));
		var rect_y1 = camera_y + spacing_height;
		var rect_x2 = rect_x1 + (spacing_width);
		var rect_y2 = rect_y1 + (spacing_height*6);
		obj_game.DrawPhraseSelect(rect_x1,rect_y1,rect_x2,rect_y2,noone);
	}
}