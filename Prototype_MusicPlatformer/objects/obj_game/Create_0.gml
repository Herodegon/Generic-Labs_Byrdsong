/// @description Initialize game objects and features
// You can write your code in this editor
#macro MAX_WINDOW_SIZE 12 // 12 = 1920x1080
						  // 10 = 1600x900
						  //  8 = 1280x720

global.windowScale = 8

initWindow();
initCamera();

script_phrases();
script_noteSystem();
spawnPlayer();

show_debug_message("Width/Height: {0}x{1}",window_get_width(),window_get_height());