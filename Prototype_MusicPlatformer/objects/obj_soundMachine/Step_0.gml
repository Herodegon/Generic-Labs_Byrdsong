/// @description Insert description here
// You can write your code in this editor
audio_sound_gain(snd_byrdSinging, targetSingingPoints, 0); //Singing points updated in player step
audio_sound_gain(snd_byrdWalking, walkingLoudness, 0); // Walking loudness updated in player step

var totalEnemyPoints = global.numEnemyMusicPoints; // This is handled by the enemy create and destroy events
// currentEnemyPoints already exists. This is handled by the sound machine
// targetEnemyPoints also already exists. This is handled by the player beginstep event


#region Handling enemy music

#region Updating currentEnemyPoints
// Current Enemy points should automatically adjust to attempt to reach target enemy points.
// It needs to increment by an amount equal to a function of my choice. I can choose the function
// to create different adjustments for sounds. For now I will go with a linear system.
if(not (targetEnemyPoints == currentEnemyPoints)){
	// If the distance is within the adjustment amount set it to the adjustment amount
	if(abs(currentEnemyPoints - targetEnemyPoints) < enemyPointAdjust) {
		currentEnemyPoints = targetEnemyPoints;
	}else {
		if(targetEnemyPoints > currentEnemyPoints) {
			currentEnemyPoints += enemyPointAdjust;
		}else {
			currentEnemyPoints -= enemyPointAdjust;
		}
	}
}
#endregion

#region Handling enemies offscreen
// Need a muffled sound effect for intensity levels that exist but arent on screen
// Should also be quieter when muffled in addition to the muffled effect
// Will be the difference between enemyPoints and totalEnemyPoints
#endregion

#region Handling Enemies on Screen
// Intensity sounds that are playing should have their noise volume based off of currentEnemyPoints
// This way it automatically adjusts as currentEnemyPoints adjusts.
#endregion




if(currentEnemyPoints > 0) {
	audio_sound_gain(snd_enemyMelody,max(.2, min(1, currentEnemyPoints/totalIntensity1)),0)
	
	if(currentEnemyPoints > totalIntensity1) {
		audio_sound_gain(snd_enemyIntensity1, min(1, (currentEnemyPoints-totalIntensity1)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity1, 0, 0);
	}
	
	if(currentEnemyPoints > totalIntensity2) {
		audio_sound_gain(snd_enemyIntensity2, min(1, (currentEnemyPoints-totalIntensity2)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity2, 0, 0);
	}
	
	
	if(currentEnemyPoints > totalIntensity3) {
		audio_sound_gain(snd_enemyIntensity3, min(1, (currentEnemyPoints-totalIntensity3)*.1),0)
	}else {
		audio_sound_gain(snd_enemyIntensity3, 0, 0);
	}
	
}
#endregion