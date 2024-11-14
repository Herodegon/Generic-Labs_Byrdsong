/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_controls))
{
	instance_destroy(obj_controls);
}
else {
	instance_create_layer(room_width / 4, room_height - 500, "Instances", obj_controls	);
}