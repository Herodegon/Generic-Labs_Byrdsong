// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initWindow()
{
	window_set_size(160*global.windowScale,90*global.windowScale);
};

function initCamera()
{
	view_enabled = true;
	view_visible[0] = true;

	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = window_get_width()/5;
	view_hport[0] = window_get_height()/5;

	view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_player, -1, -1, window_get_width()/4,window_get_height()/4);
};

function getCameraFeatures()
{
	var objCamera = view_camera[0];
	camera = {
		cam_x: camera_get_view_x(objCamera),
		cam_y: camera_get_view_y(objCamera),
		cam_w: camera_get_view_width(objCamera),
		cam_h: camera_get_view_height(objCamera),
	}
	
	return camera;
};