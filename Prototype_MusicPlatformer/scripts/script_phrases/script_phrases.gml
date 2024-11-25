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
	name: "Quarter Note",					// Name of Special Move 
	noteType: NOTE_TYPE.SINGLENOTE,			// Type of Move
	upgrade: noone,							// Pointer to the upgraded version of this phrase
	object: obj_quarternote,				// Move Object
	sprite: spr_quarternote,				// Move Sprite
	combination: [NOTE_DIRECTION.DOWN,		// Inputs to Trigger Move
				  NOTE_DIRECTION.DOWNRIGHT,
				  NOTE_DIRECTION.RIGHT]
}

#endregion

#region Basic Note
basicNote = 
{
	name: "Note",							
	noteType: NOTE_TYPE.SINGLENOTE,	
	upgrade: noone,
	object: obj_note,						
	sprite: spr_eighthnote,					
	combination: noone,						// Does not have combo input		
}

#endregion

#region Phrases - Level 1
poolPhrases = [
	//QuarterNote: 
	{
			name: "Quarter Note",
			noteType: NOTE_TYPE.SINGLENOTE,
			upgrade: noone,
			//object: obj_quarternote,
			object: obj_test_quarternote,
			sprite: spr_quarternote,
			combination: [NOTE_DIRECTION.DOWN,
						  NOTE_DIRECTION.DOWNRIGHT,
						  NOTE_DIRECTION.RIGHT]
	},
	
	//Bass:
	{
		name: "Bass",
		noteType: NOTE_TYPE.WAVENOTE,
		upgrade: noone,
		//object: obj_wave,
		object: obj_test_wave,
		sprite: spr_wave,
		combination: [NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT,
					  NOTE_DIRECTION.DOWN]
	},
	
	//Opera:
	{
		name: "Opera",
		noteType: NOTE_TYPE.ECHONOTE,
		upgrade: noone,
		object: obj_test_opera,
		sprite: spr_wave,
		combination: [NOTE_DIRECTION.UP,
					  NOTE_DIRECTION.DOWN,
					  NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT]
	}
];

#endregion