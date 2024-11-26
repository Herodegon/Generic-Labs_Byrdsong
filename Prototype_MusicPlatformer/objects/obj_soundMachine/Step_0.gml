/// @description Insert description here
// You can write your code in this editor
audio_sound_gain(snd_byrdSinging, singingPoints, 0); //Singing points updated in player step
audio_sound_gain(snd_byrdWalking, walkingLoudness, 0); // Walking loudness updated in player step

var totalEnemyPoints = global.numEnemyMusicPoints

if(global.numEnemyMusicPoints > 0) {
	audio_sound_gain(snd_enemyMelody,max(.2, min(1, global.numEnemyMusicPoints/totalIntensity1)),0)
	
	if(global.numEnemyMusicPoints > totalIntensity1) {
		audio_sound_gain(snd_enemyIntensity1, min(1, (global.numEnemyMusicPoints-totalIntensity1)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity1, 0, 0);
	}
	
	if(global.numEnemyMusicPoints > totalIntensity2) {
		audio_sound_gain(snd_enemyIntensity2, min(1, (global.numEnemyMusicPoints-totalIntensity2)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity2, 0, 0);
	}
	
	
	if(global.numEnemyMusicPoints > totalIntensity3) {
		audio_sound_gain(snd_enemyIntensity3, min(1, (global.numEnemyMusicPoints-totalIntensity3)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity3, 0, 0);
	}
	
}
