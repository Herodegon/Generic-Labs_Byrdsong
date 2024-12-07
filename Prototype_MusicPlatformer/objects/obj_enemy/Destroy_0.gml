/// @description Clean instance and enemy counter 
// You can write your code in this editor

instance_create_layer(x,y,"Instances",objDrop);
global.enemiesKilled++;
global.numEnemies--;
global.numEnemyMusicPoints -= musicPointValue;
audio_play_sound(snd_enemyDeath,1,false);