/// @description Initialize game objects and features
// You can write your code in this editor
#macro MAX_WINDOW_SIZE 12 // 12 = 1920x1080
						  // 10 = 1600x900
						  //  8 = 1280x720
#macro MILLISECONDS 1000		//1 second = 1000 milliseconds
#macro MICROSECONDS 1000000		//1 second = 1000000 microseconds

#macro DEPTH_GUI_OBJECTS -11
#macro DEPTH_GUI -10
#macro DEPTH_PLAYER 0
#macro DEPTH_PROJECTILE 1
#macro DEPTH_ENEMY 2
#macro DEPTH_PICKUPS 10

#region Initialize main game variables
//These are variables used or tracked by the game's larger systems
global.windowScale = 10;
global.isFullscreen = true;
global.gameTimer_start = -1;
global.gameTimer = 0;				//Time passed since player spawned
global.deltaTime = 0;				//Amount of time passed between frames
global.toggleGUI = true;			//Allows GUI to draw
global.canPause = true;
global.gamePaused = false;			//Forces all actors and instances to freeze
global.displayPaused = false;
global.forceSpawn = false;

global.numEnemies = 0;
global.enemiesKilled = 0;
global.numEnemyMusicPoints = 0;     //How many music points worth of enemies there are. Handled in enemy create and destroy

global.devCommandsActive = true;

prevPauseState = global.gamePaused;
timePaused = 0;
totalTimePaused = 0;

#endregion

#region Initialize window and camera
initWindow();
initCamera();

#endregion

#region Initialize scripts
script_GUI();
script_phrases();

#endregion

#region Initialize player and major game systems
spawnPlayer();
initEnemySpawner();
initPhraseStore();
initSoundMachine();

#endregion