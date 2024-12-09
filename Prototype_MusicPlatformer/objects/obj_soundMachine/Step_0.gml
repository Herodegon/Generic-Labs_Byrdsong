/// @description Insert description here
// You can write your code in this editor
audio_sound_gain(snd_byrdWalking, walkingLoudness, 0); // Walking loudness updated in player step


#region Handling different attacks

#region Handle updating currentSingingPoints to go to target points
var pointDifference = targetSingingPoints - currentSingingPoints;
var pointAdjust = max(.1, pointDifference * .01);

if(abs(targetSingingPoints - currentSingingPoints) < pointAdjust) {
	currentSingingPoints = targetSingingPoints;
}else {
	if(currentSingingPoints < targetSingingPoints) {
		currentSingingPoints += pointAdjust;
	}else {
		currentSingingPoints -= pointAdjust;
	}
}
#endregion

#region Update the loudness of the music based on currentSingingPoints
var inputSingingMusicValue = min(1, currentSingingPoints);


#region Percent Adjust function to be percentile based between values
var singingMusicCap = .5
var outputSingingMusicValue = inputSingingMusicValue * singingMusicCap;
audio_sound_gain(snd_byrdSinging, outputSingingMusicValue, 0); //Singing points updated in player step
#endregion

#endregion

#region Adjust target singing points exponentially

// Reduce points above 1 exponentially
if(targetSingingPoints > 1) {
	pointDifference = targetSingingPoints - 1;
	pointAdjust = max(.01, pointDifference * .01);
	
	targetSingingPoints -= pointAdjust;
}else {
	var singingPointReduction = 1
	targetSingingPoints -= singingPointReduction/(fps * 2); // Reduces target singing points by an amount every second.
	targetSingingPoints = max(targetSingingPoints, 0); // Cap the low at 0.
}


#endregion

#endregion

#region Handling enemy music

var totalEnemyPoints = global.numEnemyMusicPoints; // This is handled by the enemy create and destroy events
// currentEnemyPoints already exists. This is handled by the sound machine
// targetEnemyPoints also already exists. This is handled by the player beginstep event

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
			currentEnemyPoints -= 4 * enemyPointAdjust;
		}
	}
}
#endregion

#region Handling enemies offscreen
// Need a muffled sound effect for intensity levels that exist but arent on screen
// Should also be quieter when muffled in addition to the muffled effect
// Will be the difference between enemyPoints and totalEnemyPoints
#endregion

#region Handling Enemies on Screen and offscreen
// Intensity sounds that are playing should have their noise volume based off of currentEnemyPoints
// This way it automatically adjusts as currentEnemyPoints adjusts.
// Enemies that are off screen should have a much quieter sound.
var enemySoundAdjust = .1 //Controls how much an enemyMusicPoint adjusts the total sound value


if(currentEnemyPoints > 0) {
	if(currentEnemyPoints > 0) {
		audio_sound_gain(snd_enemyMelody,max(.2, min(1, currentEnemyPoints/totalIntensity1)),0)
	}else if(totalEnemyPoints > 0) {
		audio_sound_gain(snd_enemyMelody, .05, 0);
	}
	
	
	if(currentEnemyPoints > totalIntensity1) {
		audio_sound_gain(snd_enemyIntensity1, min(1, (currentEnemyPoints-totalIntensity1)/intensityLevel1),0)
	}else if(totalEnemyPoints > totalIntensity1) {
		audio_sound_gain(snd_enemyIntensity1, .05, 0)
	}else {
		audio_sound_gain(snd_enemyIntensity1, 0, 0);
	}
	
	if(currentEnemyPoints > totalIntensity2) {
		audio_sound_gain(snd_enemyIntensity2, min(1, (currentEnemyPoints-totalIntensity2)/intensityLevel2),0)
	}else if(totalEnemyPoints > totalIntensity2) {
		audio_sound_gain(snd_enemyIntensity2, .05, 0)
	}else {
		audio_sound_gain(snd_enemyIntensity2, 0, 0);
	}
	
	
	if(currentEnemyPoints > totalIntensity3) {
		audio_sound_gain(snd_enemyIntensity3, min(1, (currentEnemyPoints-totalIntensity3)/intensityLevel3),0)
	}else if(totalEnemyPoints > totalIntensity3) {
		audio_sound_gain(snd_enemyIntensity3, .05, 0)
	}else {
		audio_sound_gain(snd_enemyIntensity3, 0, 0);
	}
	
}

#endregion

#endregion