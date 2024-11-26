/// @description Insert description here
// You can write your code in this editor
var adaptiveMusic = audio_create_sync_group(true);
var test = audio_create_sync_group(false);

audio_play_in_sync_group(adaptiveMusic,snd_byrdSinging);
audio_play_in_sync_group(adaptiveMusic,snd_byrdWalking);
audio_play_in_sync_group(adaptiveMusic,snd_enemyMelody);
audio_play_in_sync_group(adaptiveMusic,snd_enemyIntensity1);
audio_play_in_sync_group(adaptiveMusic,snd_enemyIntensity2);
audio_play_in_sync_group(adaptiveMusic,snd_enemyIntensity3);

audio_sound_gain(snd_byrdSinging, 0, 0);
audio_sound_gain(snd_byrdWalking, 0, 0);
audio_sound_gain(snd_enemyMelody, 0, 0);
audio_sound_gain(snd_enemyIntensity1, 0, 0);
audio_sound_gain(snd_enemyIntensity2, 0, 0);
audio_sound_gain(snd_enemyIntensity3, 0, 0);

audio_start_sync_group(adaptiveMusic);

currentSingingPoints = 0;
currentEnemyPoints = 0;
totalIntensity1 = intensityLevel1;
totalIntensity2 = totalIntensity1 + intensityLevel2;
totalIntensity3 = totalIntensity2 + intensityLevel3;
enemyPointAdjust = .5;
singingPointAdjust = .01;