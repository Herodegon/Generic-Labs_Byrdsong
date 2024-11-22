/// @description Short-range wave attack
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_speed = 1;

hp = 100;
knockback += 1;

despawnTimer = ((sprite_get_number(sprite_index)-1)*2)*game_get_speed(gamespeed_microseconds)/MILLISECONDS;
canMove = false;

/*
isDespawnSet = false;
despawnFrames = sprite_get_number(sprite_index)-1;
*/