// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initWindow()
{
	window_set_size(160*global.windowScale,90*global.windowScale);
	window_center()
};

function initCamera()
{
	view_enabled = true;
	view_visible[0] = true;

	view_xport[0] = 0;
	view_yport[0] = 0;
	view_wport[0] = window_get_width()/5;
	view_hport[0] = window_get_height()/5;

	view_camera[0] = camera_create_view(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0, obj_player, -1, -1, window_get_width()/4,window_get_height()/4);
};

function getCameraFeatures()
{
	var objCamera = view_camera[0];
	
	var obj_x = camera_get_view_x(objCamera);
	var obj_y = camera_get_view_y(objCamera);
	var obj_w = camera_get_view_width(objCamera);
	var obj_h = camera_get_view_height(objCamera);
	
	camera = {
		cam_x: obj_x,
		cam_y: obj_y,
		cam_w: obj_w,
		cam_h: obj_h,
		cam_centerX: obj_x+(obj_w/2),
		cam_centerY: obj_y+(obj_h/2)
	}
	
	return camera;
};