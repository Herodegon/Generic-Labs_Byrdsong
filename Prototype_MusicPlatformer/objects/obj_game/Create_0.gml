/// @description Initialize game objects and features
// You can write your code in this editor
#macro MAX_WINDOW_SIZE 12 // 12 = 1920x1080
						  // 10 = 1600x900
						  //  8 = 1280x720

#region Initialize main game variables
//These are variables used or tracked by the game's larger systems
global.windowScale = 8;
global.gameTimer = 0;				//Time passed in seconds

#endregion

#region Initialize window and camera
initWindow();
initCamera();

#endregion

#region Initialize scripts
script_GUI();
script_phrases();

#endregion

#region Initialize player and level up system
spawnPlayer();
initEnemySpawner();
//initPhraseStore();

#endregion

show_debug_message("Width/Height: {0}x{1}",window_get_width(),window_get_height());