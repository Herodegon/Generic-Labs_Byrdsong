// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/* Phrase System
 * - Upon leveling up, the player is allowed to choose one of three randomly chosen phrases.
 * - Once the player has chosen the desired phrase, the phrase struct gets added to their
 *	 `availablePhrase` inventory and the struct is removed from the level list.
 */

#region Phrase Template
phraseExample = 
{
	name: "Quarter Note",										//Name of the phrase
	desc: "A mass of notes fired in a single direction.",		//Description 
	noteType: NOTE_TYPE.SINGLENOTE,
	maxLevel: 10,
	currLevel: 1,
	object: obj_test_quarternote,
	sprite: noone,
	musicPointValue: 1,
	combination: [NOTE_DIRECTION.DOWN,
					NOTE_DIRECTION.DOWNRIGHT,
					NOTE_DIRECTION.RIGHT]
}

#endregion

#region Basic Note
basicNote = 
{
	name: "Note",	
	desc: "A magical music note summoned by the pitch of Byrd's singing.",
	noteType: NOTE_TYPE.SINGLENOTE,	
	maxLevel: 10,
	currLevel: 1,
	object: obj_note,						
	sprite: spr_eighthnote,		
	musicPointValue: .25,
	combination: noone,						// Does not have combo input		
}

#endregion

#region Phrases - Level 1
poolPhrases = 
[
	//QuarterNote: 
	{
			name: "Quarter Note",
			desc: "A mass of notes fired in a single direction.",
			noteType: NOTE_TYPE.SINGLENOTE,
			maxLevel: 8,
			currLevel: 1,
			object: obj_test_quarternote,
			sprite: noone,
			musicPointValue: 1,
			combination: [NOTE_DIRECTION.DOWN,
						  NOTE_DIRECTION.DOWNRIGHT,
						  NOTE_DIRECTION.RIGHT]
	},
	
	//Bass:
	{
		name: "Bass",
		desc: "A piercing shotgun-like spread of notes.",
		noteType: NOTE_TYPE.WAVENOTE,
		maxLevel: 8,
		currLevel: 1,
		object: obj_test_wave,
		sprite: noone,
		musicPointValue: 3,
		combination: [NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT,
					  NOTE_DIRECTION.DOWN]
	},
	
	//Opera:
	{
		name: "Opera",
		desc: "An AOE shield of notes surrounds Byrd. They have a lot of health, but be careful: they don't last long!",
		noteType: NOTE_TYPE.ECHONOTE,
		maxLevel: 8,
		currLevel: 1,
		object: obj_test_opera,
		sprite: noone,
		musicPointValue: 10,
		combination: [NOTE_DIRECTION.UP,
					  NOTE_DIRECTION.DOWN,
					  NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT]
	}
];

bossDrops =
{
	screech:
	{
		name: "Screech",
		desc: "A horrid pitch releases a small amount of notes that shoot from Byrd in fear.",
		noteType: NOTE_TYPE.ECHONOTE,
		maxLevel: 5,
		currLevel: 1,
		object: obj_screech,
		sprite: noone,
		musicPointValue: 20,
		combination: [NOTE_DIRECTION.UP,
					  NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT]
	}
};

bossPhrases = 
[
	{
		name: "Screech",
		desc: "A horrid pitch releases a small amount of notes that shoot from Byrd in fear.",
		noteType: NOTE_TYPE.ECHONOTE,
		maxLevel: 5,
		currLevel: 1,
		object: obj_screech_boss,
		drop: bossDrops.screech,
		sprite: noone,
		musicPointValue: 20,
		combination: noone
	}
];

#endregion