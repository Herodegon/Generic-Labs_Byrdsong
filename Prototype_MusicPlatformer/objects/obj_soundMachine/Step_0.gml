/// @description Insert description here
// You can write your code in this editor
audio_sound_gain(snd_byrdSinging, singingLoudness, 0);
audio_sound_gain(snd_byrdWalking, walkingLoudness, 0);

var enemyCount = instance_number(obj_enemy)

if(enemyCount > 0) {
	audio_sound_gain(snd_enemyMelody,max(.2, min(1, enemyCount/intensityLevel1)),0)
	
	if(enemyCount > intensityLevel1) {
		audio_sound_gain(snd_enemyIntensity1, min(1, (enemyCount-intensityLevel1)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity1, 0, 0);
	}
	
	if(enemyCount > intensityLevel2) {
		audio_sound_gain(snd_enemyIntensity2, min(1, (enemyCount-intensityLevel2)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity2, 0, 0);
	}
	
	
	if(enemyCount > intensityLevel3) {
		audio_sound_gain(snd_enemyIntensity3, min(1, (enemyCount-intensityLevel3)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity3, 0, 0);
	}
	
}
