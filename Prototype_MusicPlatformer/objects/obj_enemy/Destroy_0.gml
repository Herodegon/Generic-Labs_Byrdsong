/// @description Clean instance and enemy counter 
// You can write your code in this editor

global.numEnemies--;
global.numEnemyMusicPoints -= musicPointValue;
audio_play_sound(snd_enemyDeath,1,false);