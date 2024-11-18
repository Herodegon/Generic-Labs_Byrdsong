/// @description Initialize game objects and features
// You can write your code in this editor
#macro MAX_WINDOW_SIZE 12 // 12 = 1920x1080
						  // 10 = 1600x900
						  //  8 = 1280x720
#macro MILLISECONDS 1000		//1 second = 1000 milliseconds
#macro MICROSECONDS 1000000		//1 second = 1000000 microseconds

#region Initialize main game variables
//These are variables used or tracked by the game's larger systems
global.windowScale = 10;
global.gameTimer_start = -1;
global.gameTimer = 0;				//Time passed since player spawned
global.deltaTime = 0;				//Amount of time passed between frames
global.toggleGUI = false;			//Allows GUI to draw
global.forceSpawn = false;

global.numEnemies = 0;

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